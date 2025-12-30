import 'package:flutter/material.dart';
import 'package:recipe_project/data/dummy_data.dart';
import 'package:recipe_project/models/meal.dart';
import 'package:recipe_project/models/settings.dart';
import 'package:recipe_project/screens/categories_meals_screen.dart';
import 'package:recipe_project/screens/meal_detail_screen.dart';
import 'package:recipe_project/screens/settings_screen.dart';
import 'package:recipe_project/screens/tabs_screen.dart';
import './utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  bool isFavorite(Meal meal){
    return _favoriteMeals.contains(meal);
  }
  
  void _toggleFavorite(Meal meal){
    setState(() {
      _favoriteMeals.contains(meal) ? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal);
    });
  }

  void _filterMeals(Settings settings){
    setState(() {
      this.settings = settings;

      _availableMeals = dummyMeals.where((meal){
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
        fontFamily: 'Raleway',
        // canvasColor: Color.fromRGBO(255, 254, 229, 1),
        scaffoldBackgroundColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed'
          )
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          backgroundColor: Colors.pink,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'RobotoCondensed'
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME : (ctx) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.CATEGORIES_MEALS : (ctx) => CategoriesMealsScreen(meals: _availableMeals,),
        AppRoutes.MEAL_DETAIL : (ctx) => MealDetailScreen(onToggleFavorite: _toggleFavorite, isFavorite: isFavorite,),
        AppRoutes.SETTINGS : (ctx) => SettingsScreen(onSettingsChanged: _filterMeals, settings: settings,)
      },
    );
  }
}