import 'package:cakey_portfolio/Presentation/routes/generated_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CakeyApp());
}


class CakeyApp extends StatelessWidget {
  const CakeyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
