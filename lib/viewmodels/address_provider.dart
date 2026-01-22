import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/address_model.dart';
import '../repositories/address_repository.dart';

class AddressNotifier extends StateNotifier<List<AddressModel>> {
  final AddressRepository _repository;

  AddressNotifier(this._repository) : super([]) {
    _loadAddresses();
  }

  void _loadAddresses() {
    state = _repository.getAddresses();
  }

  void addAddress(AddressModel address) {
    _repository.addAddress(address);
    _loadAddresses();
  }

  void updateAddress(AddressModel address) {
    _repository.updateAddress(address);
    _loadAddresses();
  }

  void deleteAddress(String id) {
    _repository.deleteAddress(id);
    _loadAddresses();
  }
}

final addressProvider =
    StateNotifierProvider<AddressNotifier, List<AddressModel>>((ref) {
      final repository = ref.read(addressRepositoryProvider);
      return AddressNotifier(repository);
    });
