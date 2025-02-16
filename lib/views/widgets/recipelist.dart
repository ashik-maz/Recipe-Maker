import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipiapp/models/recepi.dart';
import 'package:recipiapp/secret/constants.dart';
import 'package:recipiapp/views/widgets/recipe_card.dart';

class RecipeListScreen extends StatefulWidget {
  final String title;

  RecipeListScreen({super.key, required this.title});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> recipeList = [];
  bool _getRecipeListInProgress = false;

  @override
  void initState() {
    super.initState();
    _getRecipeList(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Visibility(
        visible: !_getRecipeListInProgress, // false
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: recipeList.length,
        
          itemBuilder: (context, index) {
            final recipe = recipeList[index];
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeCard(
                    title: recipe.title,
                    ingredients: recipe.ingredients,
                    instructions: recipe.instructions,
                  ),
                ),
              ),
              child: ListTile(
                title: Text(recipe.title),
               
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _getRecipeList(String search) async {
  setState(() {
    _getRecipeListInProgress = true;
  });

  Uri uri = Uri.parse('${baseUrl}query=$search');

  http.Response response = await http.get(
    uri,
    headers: {'X-Api-Key': apiKey},
  );

  if (response.statusCode == 200) {
    final decodeData = jsonDecode(response.body);
    print(decodeData); 

    // Ensure you're mapping the JSON data correctly to the Recipe model
    for (Map<String, dynamic> p in decodeData) {
      Recipe recipe = Recipe(
        title: p['title'] ?? '',  // Access title from the JSON data
        ingredients: p['ingredients'] ?? '',  // Access ingredients from the JSON data
        instructions: p['instructions'] ?? '',  // Access instructions from the JSON data
      );
      
      recipeList.add(recipe);
    }
  }

  setState(() {
    _getRecipeListInProgress = false;
  });
}

}
