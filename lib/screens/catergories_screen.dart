import 'package:flutter/material.dart';
import 'package:recipe_project/components/category_item.dart';
import 'package:recipe_project/data/dummy_data.dart';

class CatergoriesScreen extends StatelessWidget {
  const CatergoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
        children: dummyCategories.map((cat){
          return CategoryItem(category: cat);
        }).toList(),
      );
  }
}