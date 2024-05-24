import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cakey_portfolio/Presentation/routes/app_router.dart';
import 'package:flutter/material.dart';

import '../../res/app_colors.dart';
@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      context.router.replace(const OnboardingRoute());// Prints after 1 second.
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.mainTheme,
        child: Center(
          child: Image.asset('assets/images/cakey_logo.png'),
        ),
      ),
    );
  }
}
