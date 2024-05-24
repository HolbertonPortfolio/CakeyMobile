import 'package:auto_route/annotations.dart';
import 'package:cakey_portfolio/Presentation/screens/Onboarding/Pages/onboarding_first_page.dart';
import 'package:cakey_portfolio/Presentation/screens/Onboarding/Pages/onboarding_second_page.dart';
import 'package:cakey_portfolio/Presentation/screens/Onboarding/Pages/onboarding_third_page.dart';
import 'package:cakey_portfolio/Presentation/widgets/onboarding/onboarding_page_view.dart';
import 'package:flutter/material.dart';
@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> pages = const [
      OnboardingFirstPage(),
      OnboardingSecondPage(),
      OnboardingThirdPage()
    ];
    return Scaffold(
      body: OnboardingPageView(pages: pages),
    );
  }
}
