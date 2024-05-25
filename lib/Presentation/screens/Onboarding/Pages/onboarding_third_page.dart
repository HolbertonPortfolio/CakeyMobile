import 'package:cakey_portfolio/Presentation/widgets/onboarding/onboarding_column_widget.dart';
import 'package:cakey_portfolio/res/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingThirdPage extends StatelessWidget {
  const OnboardingThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingColumn(text: 'Don\'t forget share', imagePath: 'assets/images/cookie.png');
  }
}
