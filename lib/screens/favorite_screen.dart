import 'package:flutter/material.dart';
import 'package:recipe_project/components/meal_item.dart';
import 'package:recipe_project/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  
  const FavoriteScreen({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('Nenhuma refeição marcada com favorita!'),
      );
    }

    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (ctx, index){
        return MealItem(meal: favoriteMeals[index]);
      },
    );
  }
}