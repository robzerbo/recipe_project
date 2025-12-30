import 'package:flutter/material.dart';
import 'package:recipe_project/models/meal.dart';

class FavoriteButton extends StatefulWidget {
  final Meal meal;
  final Function(Meal) onToggleFavorite; 
  final Function(Meal) isFavorite; 
  
  const FavoriteButton({super.key, required this.meal, required this.onToggleFavorite, required this.isFavorite});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {

  double turns = 0;

  void _changeRotation(){
    setState(() {
      turns = turns == 0 ? 1 : 0 ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: turns,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
      child: FloatingActionButton(
          child: Icon(widget.isFavorite(widget.meal) ? Icons.star : Icons.star_border),
          onPressed: () {
            _changeRotation();
            widget.onToggleFavorite(widget.meal);
          },
        ),
    );
  }
}