import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:food_app/api/recipe_api.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:food_app/api/recipe.dart';
import 'package:food_app/main.dart';

// ignore: camel_case_types
class PossibleIng_Database {
  static final PossibleIng_Database instance = PossibleIng_Database._internal();

  static Database? _database;

  PossibleIng_Database._internal();

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
      final String path =
          join(await databasePath, 'possible_ingredients_database.db');
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
      CREATE TABLE possibleIngredients(
        id TEXT PRIMARY KEY,
        name TEXT,
      )
    ''');
  }

  Future<void> insertIngredient(Ingredient ingredient) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'possibleIngredients',
      {'name': ingredient.name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> doesIngredientExist(String name) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(
      'possibleIngredients',
      where: 'name = ?',
      whereArgs: [name],
    );
    return result.isNotEmpty;
  }
}
