import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:food_app/api/recipe_api.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:food_app/api/recipe.dart';
import 'package:food_app/pantryitems/possIng.dart';
import 'package:food_app/main.dart';

class RecipeDatabase {
  static final RecipeDatabase instance = RecipeDatabase._internal();

  static Database? _database;

  RecipeDatabase._internal();

  Future<Database> get database async {
    try {
      if (_database != null) {
        return _database!;
      }
      _database = await _initDatabase();
    } catch (e) {
      print("ERROR ERROR!! error is $e");
    }
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final databasePath = await getDatabasesPath();
      final String path = join(await databasePath, 'recipes_database.db');
      return await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
      );
    } catch (e) {
      print("erorrrr is $e");
      throw Exception("error");
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    return await db.execute('''
      CREATE TABLE recipes(
        id TEXT PRIMARY KEY,
        name TEXT,
        category TEXT,
        area TEXT,
        images TEXT,
        instructions TEXT,
        ingredients TEXT,
        youtubeUrl TEXT
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> getAllRecipes() async {
    Database db = await instance.database;
    return await db.query('recipes');
  }

  Future<void> insertRecipe(Recipe recipe) async {
    Database db = await instance.database;
    await db.insert(
      'recipes',
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> fillDatabase() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query('recipes', limit: 1);
    if (result.isEmpty) {
      List<Recipe> _recipes;
      _recipes = await RecipeApi.getRecipe();
      for (int x = 0; x < _recipes.length; x++) {
        var recipe = _recipes[x];
        try {
          for (int i = 0; i < _recipes[x].getIngredients().length; i++) {
            bool exist = await PossibleIng_Database.instance
                .doesIngredientExist(_recipes[x].getIngredients()[i].getName());
            if (!exist) {
              await PossibleIng_Database.instance.insertIngredient(
                  _recipes[x].getIngredients()[
                      i]); //return list of ingredients for that recipe
            }
          }
        } catch (e) {
          print("ummm error is $e");
        }
        await insertRecipe(recipe);
      }
    }
  }
}
