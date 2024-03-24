import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/widget/meal_item.dart';

class MealsWidget extends StatelessWidget {
  const MealsWidget(
      {super.key,
      required this.title,
      required this.meal,
      required this.onFavToggle});
  final String title;
  final List<Meal> meal;
  final Function(Meal meal) onFavToggle;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meal.length,
      itemBuilder: (ctx, index) => MealsItem(
        meal: meal[index],
        onFavToggle: onFavToggle,
      ),
    );
    if (meal.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh.....nothing here!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category.',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
      );
    }

    if (title.contains('Favorites')) {
      return Scaffold(
        body: content,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
