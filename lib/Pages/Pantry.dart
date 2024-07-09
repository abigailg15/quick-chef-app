import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pantry extends StatefulWidget {
  Pantry({super.key});
  @override
  State<Pantry> createState() => _pantry();
}

class _pantry extends State<Pantry> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: const Text("My Pantry Items")),
    );
  }
}
