import 'package:flutter/material.dart';
import 'package:recipe_project/components/meal_item.dart';
import 'package:recipe_project/models/category.dart';
import 'package:recipe_project/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  
  final List<Meal> meals;
  
  const CategoriesMealsScreen({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = meals.where((meal){
      return meal.categories.contains(category.id);
    }).toList() ;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index){
            return MealItem(meal: categoryMeals[index]);
          }
        ),
      ),
    );
  }
}