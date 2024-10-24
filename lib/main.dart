import 'package:flutter/material.dart';
import 'feature_about_us/presentation/home/about_us_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AboutUsScreen(),
    );
  }
}
