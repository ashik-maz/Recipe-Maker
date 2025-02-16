import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  String title;
  String ingredients;
  String instructions;
  RecipeCard({
    super.key,
    required this.title,
    required this.ingredients,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Text('Ingredients', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(ingredients),
          SizedBox(height: 10),
          Text('instructions', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(instructions),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
