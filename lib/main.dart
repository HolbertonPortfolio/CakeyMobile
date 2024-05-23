import 'package:flutter/material.dart';

void main() {
  runApp(CakeyApp());
}


class CakeyApp extends StatelessWidget {
  const CakeyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Salam'),
        ),
      ),
    );
  }
}
