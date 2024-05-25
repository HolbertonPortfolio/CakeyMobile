import 'package:cakey_portfolio/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingColumn extends StatelessWidget {
  final String text;
  final String imagePath;
  const OnboardingColumn({required this.text, required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainTheme,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 300, width: 350,),
          const SizedBox(height: 20,),
          Text(text, style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w500
          ),),
          const SizedBox(height: 40,),
        ],
      ),
    );
  }
}
