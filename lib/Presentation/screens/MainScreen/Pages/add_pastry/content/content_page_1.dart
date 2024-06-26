import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentPage1 extends StatelessWidget {
  const ContentPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: TextField(
            decoration: InputDecoration(
              constraints: BoxConstraints(maxHeight: 60.h),

              hintText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        24.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: TextField(
            maxLines: null,
            minLines: 5,
            decoration: InputDecoration(
              constraints: BoxConstraints(),
              hintText: 'Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
