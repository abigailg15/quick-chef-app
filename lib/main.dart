import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/OpeningPage.dart';

void main() {
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QuickChef",
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: OpeningPage(),
    );
  }
}
