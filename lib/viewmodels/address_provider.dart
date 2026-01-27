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
      state = await _repository.getAllAddresses();
    } catch (e) {
      // In a real app, you might want to expose this error to the UI
    }
  }

  Future<void> addAddress(AddressModel address) async {
    try {
      await _repository.insertAddress(address);
      await _loadAddresses();
    } catch (e) {
      // Handle error if needed
    }
  }

  Future<void> updateAddress(AddressModel address) async {
    try {
      await _repository.updateAddress(address);
      await _loadAddresses();
    } catch (e) {
      // Handle error if needed
    }
  }

  Future<void> deleteAddress(String id) async {
    try {
      await _repository.deleteAddress(id);
      await _loadAddresses();
    } catch (e) {
      // Handle error if needed
    }
  }
}

final addressProvider =
    StateNotifierProvider<AddressNotifier, List<AddressModel>>((ref) {
      final repository = ref.watch(addressRepositoryProvider);
      return AddressNotifier(repository);
    });
