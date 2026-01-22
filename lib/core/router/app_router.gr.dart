// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddUpdateAddressRoute.name: (routeData) {
      final args = routeData.argsAs<AddUpdateAddressRouteArgs>(
          orElse: () => const AddUpdateAddressRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddUpdateAddressScreen(
          key: args.key,
          address: args.address,
        ),
      );
    },
    AddressListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddressListScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [AddUpdateAddressScreen]
class AddUpdateAddressRoute extends PageRouteInfo<AddUpdateAddressRouteArgs> {
  AddUpdateAddressRoute({
    Key? key,
    AddressModel? address,
    List<PageRouteInfo>? children,
  }) : super(
          AddUpdateAddressRoute.name,
          args: AddUpdateAddressRouteArgs(
            key: key,
            address: address,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUpdateAddressRoute';

  static const PageInfo<AddUpdateAddressRouteArgs> page =
      PageInfo<AddUpdateAddressRouteArgs>(name);
}

class AddUpdateAddressRouteArgs {
  const AddUpdateAddressRouteArgs({
    this.key,
    this.address,
  });

  final Key? key;

  final AddressModel? address;

  @override
  String toString() {
    return 'AddUpdateAddressRouteArgs{key: $key, address: $address}';
  }
}

/// generated route for
/// [AddressListScreen]
class AddressListRoute extends PageRouteInfo<void> {
  const AddressListRoute({List<PageRouteInfo>? children})
      : super(
          AddressListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddressListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
