import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/provider/favorites_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filter.dart';
import 'package:meals/screens/meals_list.dart';
import 'package:meals/widget/navigation_drawer.dart';
import 'package:meals/provider/meal_provider.dart';

const kFilterApplied = {
  FilterEnum.glutenFree: false,
  FilterEnum.lactoseFree: false,
  FilterEnum.vegetarian: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});
  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  final List<Meal> _favoriteMeals = [];
  Map<FilterEnum, bool> _selectedFilter = kFilterApplied;

  int _selectedIndex = 0;
  void setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(context) {
    var favoriteMeals = ref.watch(favoriteMealsProvider);

    var meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal) {
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
      availableMeals: availableMeals,
    );
    if (_selectedIndex == 1) {
      title = 'Favorites';
      content = MealsWidget(
        title: 'Favorites',
        meal: favoriteMeals,
     
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
