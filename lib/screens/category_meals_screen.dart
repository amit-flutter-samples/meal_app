import 'package:flutter/material.dart';
import '../models/meal.dart';

import '../widgets/meal_item.dart';
import '../models/dummy_data.dart';



class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayMeals;
  var _loadedInItData = false;

  @override
  void didChangeDependencies() {
    if(!_loadedInItData) {
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoyId = routeArgs['id'];
      displayMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoyId);
      }).toList();
      _loadedInItData = true;
    }
    super.didChangeDependencies();
  }


  void _removeItem(String mealId) {
    setState(() {
      displayMeals.removeWhere((item) => item.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            affordability: displayMeals[index].affordbility,
            complexity: displayMeals[index].complexity,
            removeItem: _removeItem,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}