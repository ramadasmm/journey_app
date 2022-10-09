import 'package:flutter/material.dart';
import 'package:journey_app/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.white)),
    home: const HomeScreen(),
  ));
}
