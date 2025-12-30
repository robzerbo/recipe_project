import 'package:flutter/material.dart';
import 'package:recipe_project/components/main_drawer.dart';
import 'package:recipe_project/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;
  
  const SettingsScreen({super.key, required this.onSettingsChanged, required this.settings});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  var settings = Settings();

  @override 
  void initState(){
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(String title, String subtitle, bool value, ValueChanged<bool>? onChanged){
    return SwitchListTile.adaptive(
      inactiveThumbColor: Colors.grey[800],
      inactiveTrackColor: Colors.grey[300],
      title: Text(title),
      subtitle: Text(subtitle),
      value: value, 
      onChanged: (value){
        onChanged!(value);
        widget.onSettingsChanged(settings);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações', 
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem glúten', 
                  'Só exibe refeições sem glúten.', 
                  settings.isGlutenFree,
                  (value) => setState(() {
                    settings.isGlutenFree = value;
                  })
                ),
                _createSwitch(
                  'Sem Lactose', 
                  'Só exibe refeições sem lactose.', 
                  settings.isLactoseFree,
                  (value) => setState(() {
                    settings.isLactoseFree = value;
                  })
                ),
                _createSwitch(
                  'Vegana', 
                  'Só exibe refeições veganas.', 
                  settings.isVegan,
                  (value) => setState(() {
                    settings.isVegan = value;
                  })
                ),
                _createSwitch(
                  'Vegetariana', 
                  'Só exibe refeições vegetarianas.', 
                  settings.isVegetarian,
                  (value) => setState(() {
                    settings.isVegetarian = value;
                  })
                )
              ],
            )
          )
        ],
      )
    );
  }
}