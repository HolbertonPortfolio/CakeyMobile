import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/Onboarding/onboarding_screen.dart';
import '../screens/main_screen.dart';
import '../screens/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: '/splash', initial: true,),
    AutoRoute(page: MainRoute.page, path: '/main',),
    AutoRoute(page: OnboardingRoute.page,path: '/onboarding',),
  ];
}