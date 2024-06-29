import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Api/pastry_api_methods.dart';
import '../../../../../../cubits/add_pastry/add_pastry_cubit.dart';
import '../../home/widgets/ingredient_list.dart';

class ContentPage2 extends StatelessWidget {
  const ContentPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPastryCubit, AddPastryState>(
      builder: (context, state) {
        final cubit = context.read<AddPastryCubit>();
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// List of ingredients
              ///
              Text(
                'Choose Ingredients',
                style: TextStyle(
                    fontFamily: 'Haarith',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500),
              ),
              8.verticalSpace,
              IngredientList(
                ingredientsFuture: PastryApiMethods().getAllIngredients(),
                // Fetch ingredients
                onIngredientsSelected: (selectedIngredients) {
                  cubit.selectIngredients(selectedIngredients);
                },
              ),
              16.verticalSpace,

              /// Recipe Name
              ///
              ///
              Text(
                'Recipe',
                style: TextStyle(
                    fontFamily: 'Haarith',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500),
              ),
              8.verticalSpace,
              TextField(
                controller: cubit.recipeNameController,
                decoration: InputDecoration(
                  hintText: 'Recipe Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              16.verticalSpace,

              /// Step Description and Timer
              ///
              ///

              Text(
                'Add steps',
                style: TextStyle(
                    fontFamily: 'Haarith',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500),
              ),
              Column(
                children: cubit.steps.value.map((step) {
                  final stepNumber = step['step_number'];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Step $stepNumber Description',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onChanged: (value) {
                              step['description'] = value;
                            },
                          ),
                        ),
                        8.horizontalSpace,
                        SizedBox(
                          width: 80.w,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Timer',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              step['timer'] = int.tryParse(value) ?? 0;
                            },
                          ),
                        ),
                        8.horizontalSpace,
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            cubit.removeStep(stepNumber);
                          },
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              6.verticalSpace,
              Center(
                child: Container(
                  height: 30.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.add, color: Colors.black,),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
