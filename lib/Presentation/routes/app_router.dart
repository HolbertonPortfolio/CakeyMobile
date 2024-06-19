import 'package:auto_route/auto_route.dart';
import 'package:cakey_portfolio/Presentation/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

import '../screens/Onboarding/onboarding_screen.dart';
import '../screens/MainScreen/main_screen.dart';
import '../screens/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: '/splash'),
    AutoRoute(page: MainRoute.page, path: '/main', initial: true,),
    AutoRoute(page: OnboardingRoute.page,path: '/onboarding',),
    AutoRoute(page: PastryDetailsRoute.page, path: '/pastry-details/:id'),
  ];
}