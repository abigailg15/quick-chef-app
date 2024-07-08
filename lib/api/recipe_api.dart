import 'dart:convert';
import 'package:food_app/api/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    const letters = [
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "g",
      "h",
      "i",
      "j",
      "k",
      "l",
      "m",
      "n",
      "o",
      "p",
      "r",
      "s",
      "t",
      "v",
      "w",
      "y"
    ];
    List recipes = [];
    for (int x = 0; x < letters.length; x++) {
      var uri = Uri.https(
          'www.themealdb.com', '/api/json/v1/1/search.php', {'f': letters[x]});
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> json = jsonDecode(response.body)['meals'];
        List<String> recipeNames = [];
        for (var meal in json) {
          String mealName = meal['strMeal'];
          recipeNames.add(mealName);
        }
        for (int y = 0; y < recipeNames.length; y++) {
          var newuri = Uri.https('www.themealdb.com',
              '/api/json/v1/1/search.php', {'s': recipeNames[y]});
          final newresponse = await http.get(newuri);
          List<dynamic> mealList = jsonDecode(newresponse.body)['meals'];
          recipes.addAll(mealList);
        }

        //response.body contains raw JSON data returned by the API
        //jsonDecode converts JSON to Dart object
      } else {
        throw Exception('failed to load recipe');
      }
    }
    print(recipes[1]);
    return Recipe.recipesFromSnapshot(recipes);
  }
}
//www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata
//https://www.themealdb.com/api/json/v1/1/search.php?f=c
