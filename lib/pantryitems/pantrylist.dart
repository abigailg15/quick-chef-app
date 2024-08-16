import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:food_app/api/recipe.dart';
import 'package:food_app/main.dart';

class PantryList {
  static final PantryList instance = PantryList._internal();

  static Database? _database;

  PantryList._internal();

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
    /*
    WidgetsFlutterBinding.ensureInitialized();
    String dbPath = join(await getDatabasesPath(), 'ingredients_database.db');

    final database = await openDatabase(
      dbPath,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE ingredients(id INTEGER PRIMARY KEY, name TEXT, measure TEXT)',
        );
      },
      version: 1,
    );
    return database;
    */
    try {
      final databasePath = await getDatabasesPath();
      final path = join(await databasePath, 'ingredients_database.db');
      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE ingredients(id INTEGER PRIMARY KEY, name TEXT, measure TEXT)',
          );
        },
      );
    } catch (e) {
      print("erorrrr is $e");
      throw Exception("error");
    }
  }

  Future<void> insertIngredient(Ingredient ingredient) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'ingredients',
      ingredient.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
