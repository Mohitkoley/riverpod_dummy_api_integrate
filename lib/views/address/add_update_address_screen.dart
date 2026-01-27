import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/address_model.dart';
import '../../viewmodels/address_provider.dart';
import '../../core/mixins/validation_mixin.dart';

class AddUpdateAddressScreen extends ConsumerStatefulWidget {
  final AddressModel? address;
  const AddUpdateAddressScreen({super.key, this.address});

  @override
  ConsumerState<AddUpdateAddressScreen> createState() =>
      _AddUpdateAddressScreenState();
}

class _AddUpdateAddressScreenState extends ConsumerState<AddUpdateAddressScreen>
    with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _streetController;
  late TextEditingController _cityController;
  late TextEditingController _zipCodeController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.address?.name ?? '');
    _streetController = TextEditingController(
      text: widget.address?.street ?? '',
    );
    _cityController = TextEditingController(text: widget.address?.city ?? '');
    _zipCodeController = TextEditingController(
      text: widget.address?.zipCode ?? '',
    );
    _phoneController = TextEditingController(
      text: widget.address?.phoneNumber ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _zipCodeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _saveAddress() async {
    if (_formKey.currentState!.validate()) {
      final address = AddressModel(
        id: widget.address?.id ?? const Uuid().v4(),
        name: _nameController.text,
        street: _streetController.text,
        city: _cityController.text,
        zipCode: _zipCodeController.text,
        phoneNumber: _phoneController.text,
      );

      if (widget.address == null) {
        await ref.read(addressProvider.notifier).addAddress(address);
      } else {
        await ref.read(addressProvider.notifier).updateAddress(address);
      }
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.address == null ? 'Add Address' : 'Update Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: validateNotEmpty,
              ),
              TextFormField(
                controller: _streetController,
                decoration: const InputDecoration(labelText: 'Street'),
                validator: validateNotEmpty,
              ),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'City'),
                validator: validateNotEmpty,
              ),
              TextFormField(
                controller: _zipCodeController,
                decoration: const InputDecoration(labelText: 'Zip Code'),
                keyboardType: TextInputType.number,
                validator: validateZipCode,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: validatePhone,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveAddress,
                child: Text(widget.address == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
