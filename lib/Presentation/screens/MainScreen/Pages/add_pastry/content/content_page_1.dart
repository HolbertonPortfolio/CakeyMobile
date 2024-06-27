import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../cubits/add_pastry/add_pastry_cubit.dart';

class ContentPage1 extends StatelessWidget {
  const ContentPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPastryCubit>();

    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Name',
            style: TextStyle(fontFamily: 'Haarith', fontSize: 24.sp, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: TextField(
              controller: cubit.nameController,
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
          Text(
            'Description',
            style: TextStyle(fontFamily: 'Haarith', fontSize: 24.sp, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: TextField(
              controller: cubit.descriptionController,
              maxLines: null,
              minLines: 10,
              decoration: InputDecoration(
                constraints: const BoxConstraints(),
                hintText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}