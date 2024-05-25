import 'package:auto_route/auto_route.dart';
import 'package:cakey_portfolio/Presentation/routes/app_router.dart';
import 'package:cakey_portfolio/res/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingPageView extends StatefulWidget {
  final List<Widget> pages;

  const OnboardingPageView({required this.pages, super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final PageController _pageController = PageController();
  double currentPage = 0;
  int activePage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page ?? 0;
        activePage = currentPage.toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              currentPage = page.toDouble();
            });
          },
          itemCount: widget.pages.length,
          itemBuilder: (BuildContext context, int index) {
            return widget.pages[index % widget.pages.length];
          },
        ),
        Positioned(
          bottom: 0,
          left: 40,
          height: 100,
          child: Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  widget.pages.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        _pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        height: 16,
                        width: currentPage.round() == index ? 32 : 16,
                        decoration: BoxDecoration(
                          color: currentPage.round() == index
                              ? AppColors.green
                              : AppColors.lightGreen,
                          borderRadius: BorderRadius.circular(90),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 90,
              ),
              InkWell(
                onTap: () {
                  if (activePage != widget.pages.length - 1)
                  {
                    activePage = currentPage.toInt() + 1;
                    _pageController.animateToPage(currentPage.toInt() + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                  else {
                    activePage = currentPage.toInt();
                    context.router.replace(const MainRoute());
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  width: 120,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    activePage != widget.pages.length - 1
                        ? 'Next'
                        : 'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.lightGreen, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
