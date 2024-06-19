import 'package:cakey_portfolio/Presentation/screens/details/widgets/stepper/widgets/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Data/recipe_step.dart';

class PastryStepStepper extends StatefulWidget {
  final List<RecipeStep> steps;

  const PastryStepStepper({Key? key, required this.steps}) : super(key: key);

  @override
  PastryStepStepperState createState() => PastryStepStepperState();
}

class PastryStepStepperState extends State<PastryStepStepper> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Step Bubbles
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: (1.sw - 370) / 2),
            // height: 0.1.sh,
            width: 1.5.sw,
            child: Stack(
              children: List.generate(widget.steps.length, (index) {
                return index == 0
                    ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentPage = index;
                    });
                    _pageController.jumpToPage(index);
                  },
                  child: StepIndicator(currentPage: _currentPage, index: index,),
                )
                    : Positioned(
                  left: index * 30,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentPage = index;
                      });
                      _pageController.jumpToPage(index);
                    },
                    child: StepIndicator(currentPage: _currentPage, index: index,),
                  ),
                );
              }),
            ),
          ),
        ),
        // Page View for Steps
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: widget.steps.length,
            itemBuilder: (context, index) {
              final step = widget.steps[index];
              return Padding(
                padding: EdgeInsets.only(top: 16.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text(step.description, textAlign: TextAlign.center,),
                  ],
                ),
              );
            },
          ),
        ),
        // Navigation Buttons
        Row(
          mainAxisAlignment: _currentPage == 0
              ? MainAxisAlignment.end
              : MainAxisAlignment.spaceBetween,
          children: [
            if (_currentPage > 0)
              TextButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text('Previous'),
              ),
            if (_currentPage < widget.steps.length - 1)
              TextButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text('Next'),
              ),
          ],
        ),
      ],
    );
  }
}
