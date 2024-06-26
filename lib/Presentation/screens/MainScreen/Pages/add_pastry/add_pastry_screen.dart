import 'package:cakey_portfolio/Presentation/screens/MainScreen/Pages/add_pastry/content/content_page_1.dart';
import 'package:cakey_portfolio/Presentation/screens/MainScreen/Pages/add_pastry/content/content_page_2.dart';
import 'package:cakey_portfolio/Presentation/screens/MainScreen/Pages/add_pastry/content/content_page_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../res/app_colors.dart';
import 'widgets/primary_button.dart';

class AddPastryScreen extends StatefulWidget {
  const AddPastryScreen({super.key});

  @override
  AddPastryScreenState createState() => AddPastryScreenState();
}

class AddPastryScreenState extends State<AddPastryScreen> {
  int _currentStep = 1;

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 1) {
      setState(() {
        _currentStep--;
      });
    }
  }

  Widget _getStepContent() {
    switch (_currentStep) {
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
                  color: i == _currentStep
                      ? Colors.pinkAccent.shade200// Active step color
                      : i < _currentStep
                      ? AppColors.pink50 // Completed step color
                      : Colors.grey.shade300, // Inactive step color
                ),
                child: Center(
                  child: Text('$i', style: TextStyle(color: i == _currentStep ? Colors.white : Colors.black)),
                ),
              ),
              if (i != 3)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 4,
                      color: i < _currentStep
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
        Expanded(child: _getStepContent()),

        /// Buttons
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  text: 'Previous',
                  prefixIcon: Icons.chevron_left,
                  onPressed: _currentStep > 1 ? _previousStep : null,
                ),
              ),
              8.horizontalSpace,
              Expanded(
                child: PrimaryButton(
                  text: 'Next',
                  suffixIcon: Icons.chevron_right,
                  onPressed: _currentStep < 3 ? _nextStep : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
