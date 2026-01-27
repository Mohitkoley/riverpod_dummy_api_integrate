import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_integrate/core/constants/app_constants.dart';
import 'package:riverpod_api_integrate/core/providers/shared_prefs_provider.dart';
import 'package:riverpod_api_integrate/data/models/auth_state.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>((
  ref,
) {
  return AuthViewModel(ref);
});

class AuthViewModel extends StateNotifier<AuthState> {
  final Ref _ref;

  AuthViewModel(this._ref) : super(AuthState.initial()) {
    _checkLoginStatus();
  }

  void _checkLoginStatus() {
    _ref.listen(sharedPreferencesProvider, (previous, next) {
      next.when(
        data: (prefs) {
          final isLoggedIn = prefs.getBool(AppConstants.keyIsLoggedIn) ?? false;
          if (isLoggedIn) {
            state = AuthState.authenticated();
          } else {
            state = AuthState.unauthenticated();
          }
        },
        loading: () {}, // Already in initial state
        error: (err, stack) {
          state = AuthState.error('Failed to load local storage');
        },
      );
    }, fireImmediately: true);
  }

  Future<void> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    if (email == AppConstants.mockEmail &&
        password == AppConstants.mockPassword) {
      final prefsAsync = _ref.read(sharedPreferencesProvider);
      final prefs = prefsAsync.value;

      if (prefs != null) {
        await prefs.setBool(AppConstants.keyIsLoggedIn, true);
        state = AuthState.authenticated();
      } else {
        state = AuthState.error('Storage not ready, please try again');
      }
    } else {
      state = AuthState.error('Invalid email or password');
    }
  }

  Future<void> logout() async {
    final prefsAsync = _ref.read(sharedPreferencesProvider);
    final prefs = prefsAsync.value;

    if (prefs != null) {
      await prefs.setBool(AppConstants.keyIsLoggedIn, false);
      state = AuthState.unauthenticated();
    }
  }
}
