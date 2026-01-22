import '../data/models/address_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressRepository {
  final List<AddressModel> _addresses = [];

  List<AddressModel> getAddresses() {
    return List.from(_addresses);
  }

  void addAddress(AddressModel address) {
    _addresses.add(address);
  }

  void updateAddress(AddressModel address) {
    final index = _addresses.indexWhere((element) => element.id == address.id);
    if (index != -1) {
      _addresses[index] = address;
    }
  }

  void deleteAddress(String id) {
    _addresses.removeWhere((element) => element.id == id);
  }
}

final addressRepositoryProvider = Provider<AddressRepository>((ref) {
  return AddressRepository();
});
