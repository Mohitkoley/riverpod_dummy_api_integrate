import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/database/app_database.dart';
import '../data/models/address_model.dart';
import '../core/providers/database_provider.dart';

class AddressRepository {
  final AppDatabase _db;

  AddressRepository(this._db);

  Future<List<AddressModel>> getAllAddresses() async {
    final data = await _db.getAllAddresses();
    return data
        .map(
          (e) => AddressModel(
            id: e.id,
            name: e.name,
            street: e.street,
            city: e.city,
            zipCode: e.zipCode,
            phoneNumber: e.phoneNumber,
          ),
        )
        .toList();
  }

  Future<AddressModel?> getAddressById(String id) async {
    final data = await _db.getAllAddresses();
    final match = data.where((e) => e.id == id).firstOrNull;
    if (match == null) return null;
    return AddressModel(
      id: match.id,
      name: match.name,
      street: match.street,
      city: match.city,
      zipCode: match.zipCode,
      phoneNumber: match.phoneNumber,
    );
  }

  Future<void> insertAddress(AddressModel address) async {
    await _db.insertAddress(
      AddressTableCompanion.insert(
        id: address.id,
        name: address.name,
        street: address.street,
        city: address.city,
        zipCode: address.zipCode,
        phoneNumber: address.phoneNumber,
      ),
    );
  }

  Future<void> updateAddress(AddressModel address) async {
    await _db.updateAddress(
      AddressTableData(
        id: address.id,
        name: address.name,
        street: address.street,
        city: address.city,
        zipCode: address.zipCode,
        phoneNumber: address.phoneNumber,
      ),
    );
  }

  Future<void> deleteAddress(String id) async {
    await _db.deleteAddress(id);
  }
}

final addressRepositoryProvider = Provider<AddressRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return AddressRepository(db);
});
