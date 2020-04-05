import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './category_screen.dart';
import './favorites_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> _favoritesMeals;

  TabScreen(this._favoritesMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget._favoritesMeals),
        'title': 'Ýour Favorite'
      }
    ];

    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('categories')),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              title: Text('Favorites')),
        ],
      ),
    );
  }
}
