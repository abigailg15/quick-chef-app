import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatefulWidget {
  Favorites({super.key});
  @override
  State<Favorites> createState() => _favorites();
}

class _favorites extends State<Favorites> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Recipes")),
    );
  }
}
