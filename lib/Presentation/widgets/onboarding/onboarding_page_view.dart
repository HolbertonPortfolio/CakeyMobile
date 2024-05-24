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

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page ?? 0;
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
          left: 0,
          right: 0,
          height: 100,
          child: Row(
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
                          ? Colors.amberAccent
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
