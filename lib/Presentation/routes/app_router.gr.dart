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
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    PastryDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PastryDetailsRouteArgs>(
          orElse: () =>
              PastryDetailsRouteArgs(pastryId: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PastryDetailsScreen(
          key: args.key,
          pastryId: args.pastryId,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PastryDetailsScreen]
class PastryDetailsRoute extends PageRouteInfo<PastryDetailsRouteArgs> {
  PastryDetailsRoute({
    Key? key,
    required int pastryId,
    List<PageRouteInfo>? children,
  }) : super(
          PastryDetailsRoute.name,
          args: PastryDetailsRouteArgs(
            key: key,
            pastryId: pastryId,
          ),
          rawPathParams: {'id': pastryId},
          initialChildren: children,
        );

  static const String name = 'PastryDetailsRoute';

  static const PageInfo<PastryDetailsRouteArgs> page =
      PageInfo<PastryDetailsRouteArgs>(name);
}

class PastryDetailsRouteArgs {
  const PastryDetailsRouteArgs({
    this.key,
    required this.pastryId,
  });

  final Key? key;

  final int pastryId;

  @override
  String toString() {
    return 'PastryDetailsRouteArgs{key: $key, pastryId: $pastryId}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
