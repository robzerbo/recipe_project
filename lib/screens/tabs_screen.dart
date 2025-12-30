import 'package:flutter/material.dart';
import 'package:recipe_project/components/main_drawer.dart';
import 'package:recipe_project/models/meal.dart';
import 'package:recipe_project/screens/catergories_screen.dart';
import 'package:recipe_project/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  
  const TabsScreen({super.key, required this.favoriteMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens = [];

  @override
  void initState(){
    super.initState();
    _screens = [
      {'title' : 'Lista de Categorias', 'screen' : CatergoriesScreen()},
      {'title' : 'Favoritos', 'screen' : FavoriteScreen(favoriteMeals: widget.favoriteMeals,)}
    ];
  }

  void _selectScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => _selectScreen(value),
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.black,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos'
          ),
        ]
      ),
      
    );
  }
}