import 'package:go_router/go_router.dart';
import 'package:riverpod_api_integrate/core/router/route_names.dart';
import '../../views/home_page.dart';
import '../../views/address/address_list_screen.dart';
import '../../views/address/add_update_address_screen.dart';
import '../../data/models/address_model.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.home,
  routes: [
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) => const HomeScreen(),
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
