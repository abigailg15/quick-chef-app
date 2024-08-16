import 'package:flutter/material.dart';
import 'package:food_app/api/recipe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_app/pantryitems/pantrylist.dart';
import 'package:food_app/Widgets/ingredient_card.dart';

class AddIng extends StatefulWidget {
  AddIng({super.key});
  @override
  State<AddIng> createState() => _addIng();
}

class _addIng extends State<AddIng> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add More Ingredients")),
    );
  }
}
