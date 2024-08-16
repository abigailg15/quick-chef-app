import 'package:flutter/material.dart';
import 'package:food_app/api/recipe_database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/OpeningPage.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:food_app/pantryitems/pantrylist.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  var dbPath = join(await getDatabasesPath(), 'ingredients_database.db');
  if (kIsWeb) {
    dbPath = 'ingredients_database_web.db';
  }

  var db = await openDatabase(dbPath, onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE ingredients(id INTEGER PRIMARY KEY, name TEXT, measure TEXT)',
    );
  }, version: 1);

  await PantryList.instance.database;

  await RecipeDatabase.instance.database; // Initialize the database
  try {
    await RecipeDatabase.instance.fillDatabase();
  } catch (e) {
    print("dam u got an error in main.dart! its $e");
  }
  // Fill the database if needed

  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QuickChef",
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: OpeningPage(),
    );
  }
}
