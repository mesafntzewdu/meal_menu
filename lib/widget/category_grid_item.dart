import 'package:flutter/material.dart';
import 'package:meals/model/category.dart';
import 'package:meals/screens/meals.dart';

class CategoryGirdItem extends StatelessWidget {
  const CategoryGirdItem(
      {super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.50),
              category.color.withOpacity(1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: TextStyle(
            color: Theme.of(context).copyWith().colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
