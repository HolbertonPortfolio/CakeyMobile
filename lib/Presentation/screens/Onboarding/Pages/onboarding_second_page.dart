import 'package:cakey_portfolio/Presentation/widgets/onboarding/onboarding_column_widget.dart';
import 'package:flutter/material.dart';

class OnboardingSecondPage extends StatelessWidget {
  const OnboardingSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingColumn(text: 'Learn how to Bake', imagePath: 'assets/images/woman.png');
  }
}