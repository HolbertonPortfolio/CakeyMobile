import 'package:auto_route/auto_route.dart';
import 'package:cakey_portfolio/Data/pastry_detail.dart';
import 'package:cakey_portfolio/Presentation/routes/app_router.dart';
import 'package:cakey_portfolio/Presentation/screens/details/widgets/rows/image_and_favourite.dart';
import 'package:flutter/material.dart';
import 'package:cakey_portfolio/Api/pastry_api_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/app_colors.dart';
import 'widgets/photos/pastry_photo.dart';
import 'widgets/stepper/pastry_step_stepper.dart';

@RoutePage()
class PastryDetailsScreen extends StatelessWidget {
  final int pastryId;

  const PastryDetailsScreen({Key? key, @PathParam('id') required this.pastryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pastryApi = PastryApiMethods();

    return Scaffold(
      body: FutureBuilder<PastryDetail>(
        future: pastryApi.getPastryById(pastryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          } else {
            final pastryDetail = snapshot.data!;
            String ingredientNames = pastryDetail.ingredients
                .map((ingredient) => ingredient.name.capitalize())
                .join(', ');
            return SingleChildScrollView(
              child: Column(
                children: [
                  PastryPhoto(imageUrl: pastryDetail.imageUrl),
                  Container(
                    height: 0.65.sh,
                    color: AppColors.pink,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            children: [
                              /// Name and Favourite button
                              NameAndFavouriteButton(pastryName: pastryDetail.name),
                              SizedBox(height: 8.h),
                              Text(
                                pastryDetail.description,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Ingredients:',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Haarith',
                                ),
                              ),
                              Text(
                                ingredientNames,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              16.verticalSpace,
                            ],
                          ),
                        ),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48),
                              border: Border.all(width: 2, color: Colors.pinkAccent)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Column(
                                children: [
                                  Text(
                                    'Recipe:',
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Haarith',
                                    ),
                                  ),
                                  8.verticalSpace,
                                  Expanded(
                                    child: PastryStepStepper(steps: pastryDetail.recipeSteps),
                                  ),
                                ]
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}


extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}