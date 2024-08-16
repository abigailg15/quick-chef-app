import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String name;
  IngredientCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 80,
      color: Colors.green,
    );
  }
}
