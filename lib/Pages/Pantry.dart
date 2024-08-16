import 'package:flutter/material.dart';
import 'package:food_app/api/recipe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_app/pantryitems/pantrylist.dart';
import 'package:food_app/pages/AddIng.dart';
import 'package:food_app/Widgets/ingredient_card.dart';

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
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: SizedBox(
                height: 650,
                width: double.infinity,
                child: ListView(
                  children: [
                    IngredientCard(name: "happy"),
                    IngredientCard(name: "sad"),
                    IngredientCard(name: "asdlk"),
                    IngredientCard(name: "asdlk"),
                    IngredientCard(name: "asdlk"),
                    IngredientCard(name: "asdlk"),
                    IngredientCard(name: "asdlk"),
                    IngredientCard(name: "asdlk"),
                    IngredientCard(name: "asdlk"),
                    IngredientCard(name: "asdlk"),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ElevatedButton(
                    child: Text("Add more items"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddIng(),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*
Pantry algo: 
- create list of ingredients, use listview to put into a displayed list
- adding ingredient: add to list, then update listview (or does it update 
automatically?)
- when empty, say "Your pantry is empty!"
- add item button- give you search bar to type in, reveals dropdown menu
- of all ingredients available

- what should flutter do the first time the app is opened/downloaded:
  - load all recipes, create database of 
*/ 