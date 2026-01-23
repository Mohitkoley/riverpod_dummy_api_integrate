import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/database/database_helper.dart';
import '../../data/models/address_model.dart';

// Database helper provider
final databaseHelperProvider = Provider<DatabaseHelper>((ref) {
  return DatabaseHelper();
});

// Address repository provider
class AddressRepository {
  final DatabaseHelper _databaseHelper;

  AddressRepository(this._databaseHelper);

  Future<List<AddressModel>> getAllAddresses() async {
    return await _databaseHelper.getAddressList();
  }

  Future<AddressModel?> getAddressById(String id) async {
    return await _databaseHelper.getAddressById(id);
  }

  Future<String> insertAddress(AddressModel address) async {
    final id = await _databaseHelper.insertAddress(address);
    return address.id;
  }

  Future<int> updateAddress(AddressModel address) async {
    return await _databaseHelper.updateAddress(address);
  }

  Future<int> deleteAddress(String id) async {
    return await _databaseHelper.deleteAddress(id);
  }

  Future<int> getAddressesCount() async {
    return await _databaseHelper.getCount();
  }
}

// Address repository provider
final addressRepositoryProvider = Provider<AddressRepository>((ref) {
  final databaseHelper = ref.watch(databaseHelperProvider);
  return AddressRepository(databaseHelper);
});

// Address state
class AddressState {
  final List<AddressModel> addresses;
  final bool isLoading;
  final String? error;

  AddressState({this.addresses = const [], this.isLoading = false, this.error});

  AddressState copyWith({
    List<AddressModel>? addresses,
    bool? isLoading,
    String? error,
  }) {
    return AddressState(
      addresses: addresses ?? this.addresses,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

// Address provider
class AddressNotifier extends StateNotifier<AddressState> {
  final AddressRepository _repository;

  AddressNotifier(this._repository) : super(AddressState());

  Future<void> loadAddresses() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final addresses = await _repository.getAllAddresses();
      state = state.copyWith(addresses: addresses, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load addresses: $e',
      );
    }
  }

  Future<void> addAddress(AddressModel address) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.insertAddress(address);
      await loadAddresses(); // Refresh the list
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to add address: $e',
      );
    }
  }

  Future<void> updateAddress(AddressModel address) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.updateAddress(address);
      await loadAddresses(); // Refresh the list
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to update address: $e',
      );
    }
  }

  Future<void> deleteAddress(String id) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.deleteAddress(id);
      await loadAddresses(); // Refresh the list
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to delete address: $e',
      );
    }
  }

  Future<AddressModel?> getAddressById(String id) async {
    try {
      return await _repository.getAddressById(id);
    } catch (e) {
      state = state.copyWith(error: 'Failed to get address: $e');
      return null;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Address provider
final addressProvider = StateNotifierProvider<AddressNotifier, AddressState>((
  ref,
) {
  final repository = ref.watch(addressRepositoryProvider);
  return AddressNotifier(repository);
});

// Individual address provider for getting a specific address
final addressByIdProvider = FutureProvider.family<AddressModel?, String>((
  ref,
  id,
) async {
  final repository = ref.watch(addressRepositoryProvider);
  return await repository.getAddressById(id);
});
