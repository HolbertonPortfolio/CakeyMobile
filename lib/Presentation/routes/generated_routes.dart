import 'package:cakey_portfolio/Presentation/screens/main_screen.dart';
import 'package:cakey_portfolio/Presentation/screens/onboarding_screen.dart';
import 'package:cakey_portfolio/Presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {

      case '/home':
        return _noAnimationRoute(const MainScreen());

      case '/onboarding':
        return _noAnimationRoute(const OnboardingScreen());

      case '/splash':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error!'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }


  static PageRouteBuilder _noAnimationRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }
}