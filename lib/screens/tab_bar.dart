import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filter.dart';
import 'package:meals/screens/meals_list.dart';
import 'package:meals/widget/navigation_drawer.dart';

const kFilterApplied = {
  FilterEnum.glutenFree: false,
  FilterEnum.lactoseFree: false,
  FilterEnum.vegetarian: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  final List<Meal> _favoriteMeals = [];
  Map<FilterEnum, bool> _selectedFilter = kFilterApplied;

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
    final availableMeals = DummyData.dummyMeals.where((meal) {
      if (_selectedFilter[FilterEnum.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[FilterEnum.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilter[FilterEnum.vegetarian]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    String title = 'Mesi Grocery';
    Widget content = CategoriesScreen(
      onFavToggle: _toggleMealFavoriteState,
      availableMeals: availableMeals,
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

    void setScreen(String ident) async {
      Navigator.of(context).pop();
      if (ident == 'Settings') {
        var filterResult =
            await Navigator.of(context).push<Map<FilterEnum, bool>>(
          MaterialPageRoute(
            builder: (context) {
              return const Filter();
            },
          ),
        );
        setState(() {
          _selectedFilter = filterResult ?? kFilterApplied;
        });
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
