import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/address_model.dart';
import '../repositories/address_repository.dart';

class AddressNotifier extends StateNotifier<List<AddressModel>> {
  final AddressRepository _repository;

  AddressNotifier(this._repository) : super([]) {
    _loadAddresses();
  }

  Future<void> _loadAddresses() async {
    try {
      state = await _repository.getAddresses();
    } catch (e) {
      // Handle error if needed
      print('Error loading addresses: $e');
    }
  }

  Future<void> addAddress(AddressModel address) async {
    try {
      await _repository.addAddress(address);
      await _loadAddresses();
    } catch (e) {
      // Handle error if needed
      print('Error adding address: $e');
    }
  }

  Future<void> updateAddress(AddressModel address) async {
    try {
      await _repository.updateAddress(address);
      await _loadAddresses();
    } catch (e) {
      // Handle error if needed
      print('Error updating address: $e');
    }
  }

  Future<void> deleteAddress(String id) async {
    try {
      await _repository.deleteAddress(id);
      await _loadAddresses();
    } catch (e) {
      // Handle error if needed
      print('Error deleting address: $e');
    }
  }
}

final addressProvider =
    StateNotifierProvider<AddressNotifier, List<AddressModel>>((ref) {
      final repository = ref.read(addressRepositoryProvider);
      return AddressNotifier(repository);
    });
