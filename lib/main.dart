import 'package:flutter/material.dart';
import 'package:flutter_project/core/presentation/temporaly_theme.dart';
import 'package:flutter_project/feature_about_us/presentation/home/about_us_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemporalyTheme(
      child: MaterialApp(
        home: AboutUsScreen()
      ),
    );
  }
}