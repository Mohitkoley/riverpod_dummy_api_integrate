import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_integrate/core/router/route_names.dart';
import 'package:riverpod_api_integrate/viewmodels/auth_viewmodel.dart';
import 'package:riverpod_api_integrate/views/login_screen.dart';
import 'package:riverpod_api_integrate/views/splash_screen.dart';
import 'package:riverpod_api_integrate/data/models/auth_state.dart';
import '../../views/home_page.dart';
import '../../views/address/address_list_screen.dart';
import '../../views/address/add_update_address_screen.dart';
import '../../data/models/address_model.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authViewModelProvider);

  return GoRouter(
    initialLocation: RouteNames.splash,
    refreshListenable: RouterRefreshListenable(ref),
    redirect: (context, state) {
      final status = authState.status;
      final location = state.matchedLocation;

      // While authentication is being determined, stay on splash or redirect to it
      if (status == AuthStatus.initial) {
        return (location == RouteNames.splash) ? null : RouteNames.splash;
      }

      final isLoggedIn = status == AuthStatus.authenticated;

      if (isLoggedIn) {
        // If logged in, don't allow visiting Login or Splash screens
        if (location == RouteNames.login || location == RouteNames.splash) {
          return RouteNames.home;
        }
      } else {
        // If not logged in, force the user to the Login screen
        if (location != RouteNames.login) {
          return RouteNames.login;
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.addressList,
        builder: (context, state) => const AddressListScreen(),
      ),
      GoRoute(
        path: RouteNames.addUpdateAddressRoute,
        builder: (context, state) {
          final address = state.extra as AddressModel?;
          return AddUpdateAddressScreen(address: address);
        },
      ),
    ],
  );
});

class RouterRefreshListenable extends ChangeNotifier {
  RouterRefreshListenable(Ref ref) {
    // Refresh the router whenever the auth state changes
    ref.listen(authViewModelProvider, (_, __) {
      notifyListeners();
    });
  }
}
