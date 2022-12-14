import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:journey_app/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.white)),
    home: const HomeScreen(),
  ));
}
