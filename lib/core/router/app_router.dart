import 'package:auto_route/auto_route.dart';
import 'package:riverpod_api_integrate/core/router/route_names.dart';
import '../../views/home_page.dart';
import '../../views/address/address_list_screen.dart';
import '../../views/address/add_update_address_screen.dart';
import '../../data/models/address_model.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true, path: RouteNames.home),
    AutoRoute(page: AddressListRoute.page, path: RouteNames.addressList),
    AutoRoute(
      page: AddUpdateAddressRoute.page,
      path: RouteNames.addUpdateAddressRoute,
    ),
  ];
}
