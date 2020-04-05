import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoritesMeals;

  FavoritesScreen(this._favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoritesMeals.isEmpty) {
      return Center(
        child: Text('You have no fav meals.'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favoritesMeals[index].id,
            title: _favoritesMeals[index].title,
            imageUrl: _favoritesMeals[index].imageUrl,
            duration: _favoritesMeals[index].duration,
            affordability: _favoritesMeals[index].affordbility,
            complexity: _favoritesMeals[index].complexity,
          );
        },
        itemCount: _favoritesMeals.length,
      );
    }
  }
}
