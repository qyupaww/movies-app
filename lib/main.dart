import 'package:flutter/material.dart';
import 'package:movies_app/views/main_navigator_screen.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Movies App",
      home: MainNavigatorScreen(),
    );
  }
}
