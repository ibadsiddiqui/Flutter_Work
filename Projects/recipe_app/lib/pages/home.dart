import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/utils/store.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipes = getRecipes();
  List<String> favRecipesIDs = getFavoritesIDs();

// New method:
  // Inactive widgets are going to call this method to
  // signalize the parent widget HomeScreen to refresh the list view.
  void _handleFavoritesListChanged(String recipeID) {
    // Set new state and refresh the widget:
    setState(() {
      if (favRecipesIDs.contains(recipeID)) {
        favRecipesIDs.remove(recipeID);
      } else {
        favRecipesIDs.add(recipeID);
      }
    });
  }

  Widget build(BuildContext context) {
    double _iconSize = 20.0;

    Column _buildRecipes(List<Recipe> recipesList) {
      return Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: recipesList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(recipesList[index].name),
                );
              },
            ),
          ),
        ],
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 2.0,
            bottom: TabBar(
              labelColor: Theme.of(context).indicatorColor,
              tabs: [
                Tab(icon: Icon(Icons.restaurant, size: _iconSize)),
                Tab(icon: Icon(Icons.local_drink, size: _iconSize)),
                Tab(icon: Icon(Icons.favorite, size: _iconSize)),
                Tab(icon: Icon(Icons.settings, size: _iconSize)),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: TabBarView(
            // Placeholders for content of the tabs:
            children: [
              _buildRecipes(recipes
                  .where((recipe) => recipe.type == RecipeType.food)
                  .toList()),
              _buildRecipes(recipes
                  .where((recipe) => recipe.type == RecipeType.drink)
                  .toList()),
              _buildRecipes(recipes
                  .where((recipe) => favRecipesIDs.contains(recipe.id))
                  .toList()),
              Center(child: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
}
