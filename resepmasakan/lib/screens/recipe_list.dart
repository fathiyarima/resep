import 'package:flutter/material.dart';
import 'package:resepmasakan/models/recipe.dart';
import 'recipe_detail.dart';


class RecipeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipes = Recipe.getSampleRecipes();

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Resep'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                recipe.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(recipe.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(
                      title: recipe.title,
                      image: recipe.image,
                      ingredients: recipe.ingredients,
                      steps: recipe.steps,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
