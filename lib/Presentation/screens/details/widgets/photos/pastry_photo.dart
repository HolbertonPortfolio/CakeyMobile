import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Data/pastry_detail.dart';
import '../../../../../res/app_colors.dart';
import '../../../../routes/app_router.dart';

class PastryPhoto extends StatelessWidget {

  final String imageUrl;
  const PastryPhoto({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.4.sh,
      width: 1.sw,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          40.verticalSpace,
          IconButton(
              icon: Icon(
                Icons.keyboard_backspace_outlined,
                size: 35.w,
                color: Colors.white,
              ),
              onPressed: () =>
                  context.router.replace(const MainRoute())),
          const Spacer(),
          Container(
            height: 10.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: AppColors.pink,),
          )
        ],
      ),
    );
  }
}
