import '../data/models/address_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/database/database_helper.dart';

class AddressRepository {
  final DatabaseHelper _databaseHelper;

  AddressRepository(this._databaseHelper);

  Future<List<AddressModel>> getAddresses() async {
    return await _databaseHelper.getAddressList();
  }

  Future<void> addAddress(AddressModel address) async {
    await _databaseHelper.insertAddress(address);
  }

  Future<void> updateAddress(AddressModel address) async {
    await _databaseHelper.updateAddress(address);
  }

  Future<void> deleteAddress(String id) async {
    await _databaseHelper.deleteAddress(id);
  }

  Future<AddressModel?> getAddressById(String id) async {
    return await _databaseHelper.getAddressById(id);
  }
}

final addressRepositoryProvider = Provider<AddressRepository>((ref) {
  final databaseHelper = DatabaseHelper();
  return AddressRepository(databaseHelper);
});
