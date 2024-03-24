import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filter.dart';
import 'package:meals/screens/meals_list.dart';
import 'package:meals/widget/navigation_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  final List<Meal> _favoriteMeals = [];

  void _snakBarMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(label: 'Undo', onPressed: () {}),
      ),
    );
  }

  void _toggleMealFavoriteState(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _snakBarMessage('Item removed');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _snakBarMessage('Item added');
      });
    }
  }

  int _selectedIndex = 0;
  void setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(context) {
    String title = 'Mesi Grocery';
    Widget content = CategoriesScreen(
      onFavToggle: _toggleMealFavoriteState,
    );
    if (_selectedIndex == 1) {
      title = 'Favorites';
      content = MealsWidget(
        title: 'Favorites',
        meal: _favoriteMeals,
        onFavToggle: (meal) {
          _toggleMealFavoriteState(meal);
        },
      );
    }

    void setScreen(String ident) {
      Navigator.of(context).pop();
      if (ident == 'Settings') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const Filter();
            },
          ),
        );
      }
    }

    return Scaffold(
      drawer: HomeNavigation(
        onDrawerListClicked: setScreen,
      ),
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal_outlined), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
        onTap: (index) {
          setSelectedIndex(index);
        },
      ),
    );
  }
}
