import 'package:flutter/material.dart';
import 'package:skills_prompt_tests/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // Navigate to the new HomePage
    );
  }
}
