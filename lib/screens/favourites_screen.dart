import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavoritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return Center(
        child: Text("You have no favorites yet - start adding some"),
      );
    }
  }
}
