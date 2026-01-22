import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/router/app_router.dart';
import '../../viewmodels/address_provider.dart';

@RoutePage()
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
                      context.router.push(
                        AddUpdateAddressRoute(address: address),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(AddUpdateAddressRoute());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
