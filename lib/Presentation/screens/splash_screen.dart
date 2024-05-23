import 'package:flutter/material.dart';

import '../../res/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/onboarding');// Prints after 1 second.
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
