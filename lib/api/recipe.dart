import 'dart:convert';

class Recipe {
  final String id;
  final String name;
  final String category;
  final String area;
  final String images;
  final String instructions;
  final String youtubeUrl;
  late final List ingredients;

  Recipe(
      {required this.name,
      required this.images,
      required this.area,
      required this.category,
      required this.id,
      required this.instructions,
      required this.youtubeUrl,
      required this.ingredients});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'area': area,
      'images': images,
      'instructions': instructions,
      'youtubeUrl': youtubeUrl,
      'ingredients': ingredientsToString(),
    };
  }

  String getName() {
    return name;
  }

  String getImages() {
    return images;
  }

  String getArea() {
    return area;
  }

  String getCategory() {
    return category;
  }

  String getID() {
    return id;
  }

  String getInstructions() {
    return instructions;
  }

  String getURL() {
    return youtubeUrl;
  }

  List getIngredients() {
    return ingredients;
  }

  String ingredientsToString() {
    String finalList = "";
    for (int x = 0; x < ingredients.length - 1; x++) {
      finalList += ingredients[x].getName();
      finalList += ":";
    }
    print(finalList);
    return finalList;
  }

  factory Recipe.fromJson(dynamic json) {
    try {
      List<Ingredient> ingredients = [];
      for (int i = 1; i <= 20; i++) {
        String tempID = json['strIngredient'] as String? ?? '';
        int ingredientID = 0;
        if (tempID != '') {
          ingredientID = int.parse(tempID) + i;
        }
        String ingredientName = json['strIngredient$i'] as String? ?? '';
        String ingredientMeasure = json['strMeasure$i'] as String? ?? '';
        if (ingredientName.isNotEmpty) {
          ingredients
              .add(Ingredient(ingredientID, ingredientName, ingredientMeasure));
        }
      }
      return Recipe(
        id: json['idMeal'] as String,
        instructions: json['strInstructions'] as String,
        youtubeUrl: json['strYoutube'] as String,
        name: json['strMeal'] as String,
        images: json['strMealThumb'] as String,
        area: json['strArea'] as String,
        ingredients: ingredients,
        category: json['strCategory'] as String,
      );
    } catch (e) {
      print("error!!! Error is $e");
      throw Exception("Error parsing Recipe from JSON: $e");
    }
  }
  static List<Recipe> recipesFromSnapshot(List snapshot) {
    try {
      List<Recipe> recipes =
          snapshot.map((data) => Recipe.fromJson(data)).toList();
      return recipes;
    } catch (e) {
      throw Exception('Error converting snapshot to Recipe: $e');
    }
  }
}

class Ingredient {
  final int id;
  final String name;
  final String measure;
  Ingredient(this.id, this.name, this.measure);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'measure': measure,
    };
  }

  String getName() {
    return name;
  }

  String getMeasure() {
    return measure;
  }

  int getID() {
    return id;
  }

  @override
  String toString() {
    return 'Ingredient{id: $id, name: $name, measure: $measure}';
  }
}
