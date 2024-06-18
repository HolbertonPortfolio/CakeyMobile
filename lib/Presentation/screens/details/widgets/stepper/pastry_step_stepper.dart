import 'package:flutter/material.dart';
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Step ${step.stepNumber}:',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(step.description),
                    Text('Timer: ${step.timer} seconds'),
                  ],
                ),
              );
            },
          ),
        ),
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
