import 'package:flutter/material.dart';
import './models/dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tab_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './models/meal.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegetarian' : false,
    'vegan' : false
  };

  List<Meal> _availablemeals = DUMMY_MEALS;

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availablemeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if(_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if(_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        if(_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20,51,51,1)
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          title: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'
          )
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(_availablemeals),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(),
        FiltersScreen.routeName : (ctx) => FiltersScreen(_setFilter, _filters),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabScreen());
      },
    );
  }
}