import 'package:flutter/material.dart';
import 'package:recipiapp/views/widgets/recipelist.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _searchController = TextEditingController();

  void _searchRecipe() {
    String searchText = _searchController.text.trim();
    if (searchText.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeListScreen(title: searchText),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text("Food Recipe"),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search Recipe",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchRecipe,
              child: const Text("Search"),
            ),
          ],
        ),
      ),
    );
  }
}
