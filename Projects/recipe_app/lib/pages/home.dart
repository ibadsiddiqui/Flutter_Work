import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/model/state.dart';
import 'package:recipe_app/utils/store.dart';
import 'package:recipe_app/widgets/Recipecards/RecipeCard.dart';
import 'package:recipe_app/widgets/State/state_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StateModel appState;
  List<Recipe> recipes = getRecipes();
  List<String> favRecipesIDs = getFavoritesIDs();

  Center _buildLoadingIndicator() {
    return Center(
      child: new CircularProgressIndicator(),
    );
  }

  TabBarView _buildTabsContent() {
    Padding _buildRecipes(List<Recipe> recipesList) {
      return Padding(
        // Padding before and after the list view:
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: recipesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return new RecipeCard(
                    recipe: recipesList[index],
                    inFavorites: favRecipesIDs.contains(recipesList[index].id),
                    onFavoriteButtonPressed: _handleFavoritesListChanged,
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    return TabBarView(
      children: [
        _buildRecipes(
            recipes.where((recipe) => recipe.type == RecipeType.food).toList()),
        _buildRecipes(recipes
            .where((recipe) => recipe.type == RecipeType.drink)
            .toList()),
        _buildRecipes(recipes
            .where((recipe) => favRecipesIDs.contains(recipe.id))
            .toList()),
        Center(child: Icon(Icons.settings)),
      ],
    );
  }

  DefaultTabController _buildTabView({Widget body}) {
    const double _iconSize = 20.0;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          // We set Size equal to passed height (50.0) and infinite width:
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
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
          child: body,
        ),
      ),
    );
  }

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

  Widget _buildContent() {
    // if (appState.isLoading) {
    //   return _buildTabView(
    //     body: _buildLoadingIndicator(),
    //   );
    // } else if (!appState.isLoading && appState.user == null) {
    //   return new LoginPage();
    // } else {
    return _buildTabView(
      body: _buildTabsContent(),
    );
    // }
  }

  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    return _buildContent();
  }
}
