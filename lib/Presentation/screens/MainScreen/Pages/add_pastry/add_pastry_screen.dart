import 'package:cakey_portfolio/Presentation/screens/MainScreen/Pages/add_pastry/content/content_page_1.dart';
import 'package:cakey_portfolio/Presentation/screens/MainScreen/Pages/add_pastry/content/content_page_2.dart';
import 'package:cakey_portfolio/Presentation/screens/MainScreen/Pages/add_pastry/content/content_page_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cubits/add_pastry/add_pastry_cubit.dart';
import '../../../../../res/app_colors.dart';
import 'widgets/primary_button.dart';

class AddPastryScreen extends StatelessWidget {
  const AddPastryScreen({super.key});

  Widget _getStepContent(int currentStep) {
    switch (currentStep) {
      case 1:
        return const ContentPage1();
      case 2:
        return const ContentPage2();
      case 3:
        return const ContentPage3();
      default:
        return const Center(child: Text('Husu'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPastryCubit, AddPastryState>(
      listener: (context, state) {
        if (state is AddPastryValidationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: BlocBuilder<AddPastryCubit, AddPastryState>(
        builder: (context, state) {
          final cubit = context.read<AddPastryCubit>();
          int currentStep = cubit.currentStep.value;

          return Column(
            children: [
              24.verticalSpace,

              /// Steps
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(children: [
                  for (int i = 1; i <= 3; i++) ...[
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == currentStep
                            ? Colors.pinkAccent.shade200 // Active step color
                            : i < currentStep
                            ? AppColors.pink50 // Completed step color
                            : Colors.grey.shade300, // Inactive step color
                      ),
                      child: Center(
                        child: Text('$i', style: TextStyle(color: i == currentStep ? Colors.white : Colors.black)),
                      ),
                    ),
                    if (i != 3)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            height: 4,
                            color: i < currentStep
                                ? AppColors.pink50 // Line color for completed steps
                                : Colors.grey.shade300, // Line color for upcoming steps
                          ),
                        ),
                      ),
                  ],
                ]),
              ),

              Divider(
                color: Colors.grey,
                height: 48.h,
              ),

              /// Content
              Expanded(child: _getStepContent(currentStep)),

              /// Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        text: 'Previous',
                        prefixIcon: Icons.chevron_left,
                        onPressed: currentStep > 1 ? cubit.previousStep : null,
                      ),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: PrimaryButton(
                        text: 'Next',
                        suffixIcon: Icons.chevron_right,
                        onPressed: currentStep < 3 ? cubit.nextStep : null,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}