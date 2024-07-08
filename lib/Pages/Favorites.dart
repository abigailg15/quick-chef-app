import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatefulWidget {
  Favorites({super.key});
  @override
  State<Favorites> createState() => _favorites();
}

class _favorites extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Recipes")),
    );
  }
}
