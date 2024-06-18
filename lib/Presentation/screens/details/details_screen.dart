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
                .map((ingredient) => ingredient.name)
                .join(', ');
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PastryPhoto(imageUrl: pastryDetail.imageUrl),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    color: AppColors.pink,
                    child: Column(
                      children: [
                        /// Name and Favourite button
                        NameAndFavouriteButton(pastryName: pastryDetail.name),
                        SizedBox(height: 8.h),

                        Text(
                          pastryDetail.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Ingredients:',
                          style: TextStyle(
                              fontSize: 24.sp, fontWeight: FontWeight.bold, fontFamily: 'Haarith'),
                        ),
                        Text(ingredientNames, textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp),),
                        const SizedBox(height: 16),
                        const Text(
                          'Recipe:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        ...pastryDetail.recipeSteps.map((step) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Step ${step.stepNumber}:',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(step.description),
                              Text('Timer: ${step.timer} seconds'),
                              const SizedBox(height: 8),
                            ],
                          );
                        }).toList(),
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
