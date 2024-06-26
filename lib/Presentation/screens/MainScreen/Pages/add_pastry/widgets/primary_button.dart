import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../res/app_colors.dart';

class PrimaryButton extends StatelessWidget {

  final String text;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;

  const PrimaryButton({super.key, required this.text, this.prefixIcon, this.suffixIcon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.pink50,
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          foregroundColor: Colors.pink
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixIcon != null ? Icon(prefixIcon) : const SizedBox.shrink(),
          Text(text),
          suffixIcon != null ? Icon(suffixIcon) : const SizedBox.shrink()
        ],
      ),
    );
  }
}
