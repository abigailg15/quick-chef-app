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

  String getName() {
    return name;
  }

  factory Recipe.fromJson(dynamic json) {
    try {
      List<Ingredient> ingredients = [];
      for (int i = 1; i <= 20; i++) {
        String ingredientName = json['strIngredient$i'] as String? ?? '';
        String ingredientMeasure = json['strMeasure$i'] as String? ?? '';
        if (ingredientName.isNotEmpty) {
          ingredients.add(Ingredient(ingredientName, ingredientMeasure));
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
  final String name;
  final String measure;
  Ingredient(this.name, this.measure);
}
