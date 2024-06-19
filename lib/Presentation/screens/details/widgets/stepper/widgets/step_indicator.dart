import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepIndicator extends StatelessWidget {
  final int currentPage;
  final int index;

  const StepIndicator({Key? key, required this.currentPage, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      // switchInCurve: Curves.easeIn,
      // switchOutCurve: Curves.easeOut,
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: Container(
        key: ValueKey<int>(currentPage == index ? 1 : 0), // Unique key for animation
        width: 48.0.w,
        height: 48.0.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == index ? Colors.pink : Colors.pink[100],
        ),
        child: Center(
          child: Text(
            (index + 1).toString(),
            style: TextStyle(fontFamily: 'Haarith', fontSize: 18.sp),
          ),
        ),
      ),
    );
  }
}
