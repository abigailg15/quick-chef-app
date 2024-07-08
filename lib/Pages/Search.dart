import 'package:flutter/material.dart';
import 'package:food_app/api/recipe.dart';
import 'package:food_app/api/recipe_api.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_app/Widgets/Recipe_Card.dart';

class Search extends StatefulWidget {
  Search({super.key});
  @override
  State<Search> createState() => _search();
}

class _search extends State<Search> {
  late List<Recipe> _recipes;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    print("startingGetRecipes");
    //Future: used for fetching data, doesn't block main thread of execution
    //await: pauses async function until "future" compeltes
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      category: _recipes[index].category,
                      area: _recipes[index].area,
                      thumbnailUrl: _recipes[index].images);
                }));
  }
}

//appBar: AppBar(title: const Text('Search Available Recipes')),
       // body: RecipeCard(
       //   title: "Recipe",
       //   cookTime: "400 min",
        //  rating: "1.0",
        //  thumbnailUrl:
       //       "https://cats.com/wp-content/uploads/2022/05/cat-loaf-feature-compressed.jpg",
    //    ));

//isLoading
          //  ? Center(child: CircularProgressIndicator())
       //     : ListView.builder(
       //         itemCount: _recipes.length,
       //         itemBuilder: (context, index) {
       //           return RecipeCard(
      //              title: _recipes.name;

      //            );
       //         },
      //        )
