import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/route_names.dart';
import '../../viewmodels/address_provider.dart';

class AddressListScreen extends ConsumerWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addresses = ref.watch(addressProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Address List')),
      body: addresses.isEmpty
          ? const Center(child: Text('No addresses found'))
          : ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final address = addresses[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(address.name),
                    subtitle: Text('${address.street}, ${address.city}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        ref
                            .read(addressProvider.notifier)
                            .deleteAddress(address.id);
                      },
                    ),
                    onTap: () {
                      context.push(
                        RouteNames.addUpdateAddressRoute,
                        extra: address,
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(RouteNames.addUpdateAddressRoute);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
