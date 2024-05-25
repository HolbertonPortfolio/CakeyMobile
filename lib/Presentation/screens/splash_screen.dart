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

  bool _visible = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      context.router.replace(const OnboardingRoute());// Prints after 1 second.
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _visible = false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.mainTheme,
        child: AnimatedOpacity(
          // If the widget is visible, animate to 0.0 (invisible).
          // If the widget is hidden, animate to 1.0 (fully visible).
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(seconds: 3),
          // The green box must be a child of the AnimatedOpacity widget.
          child: Center(
            child: Image.asset('assets/images/cakey_logo.png'),
          ),
        ),
      ),
    );
  }
}
