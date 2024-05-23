import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(itemBuilder: (context, index) {
      return Container(
        color: Colors.orange,
        child: Center(child: Text('$index'),),
      );
    },);
  }
}
