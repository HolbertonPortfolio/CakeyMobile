import 'package:cakey_portfolio/Presentation/widgets/onboarding/onboarding_column_widget.dart';
import 'package:cakey_portfolio/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingFirstPage extends StatelessWidget {
  const OnboardingFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingColumn(text: 'Discover new Pastries', imagePath: 'assets/images/pancakes.png');
  }
}
