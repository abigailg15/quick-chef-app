import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HomePage.dart';

class OpeningPage extends StatefulWidget {
  OpeningPage({super.key});
  State<OpeningPage> createState() => _openingPage();
}

class _openingPage extends State<OpeningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/spaghet.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Align(
            alignment: Alignment(0.0, -0.5),
            child: Container(
              child: Text(
                "QuickChef",
                textAlign: TextAlign.center,
                style: GoogleFonts.lobster(
                  textStyle: const TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text("Let's get cooking!"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
