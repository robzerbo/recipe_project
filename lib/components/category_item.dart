import 'package:flutter/material.dart';
import 'package:recipe_project/models/category.dart';
import 'package:recipe_project/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  
  const CategoryItem({super.key, required this.category});

  void _selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS, 
      arguments: category
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return 
    InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.5),
              category.color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}