import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key, required this.meal, required this.onFavToggle});
  final Meal meal;
  final Function(Meal meal) onFavToggle;
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Detail'),
        elevation: 2,
        actions: [
          IconButton(
              onPressed: () {
                onFavToggle(meal);
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          Image.network(
            meal.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Steps',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          ...meal.steps.map(
            (e) {
              return Text(
                e,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                textAlign: TextAlign.center,
              );
            },
          ),
          // for (var steps in meal.steps)
          //   Text(
          //     steps,
          //     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //     textAlign: TextAlign.center,
          //   ),
        ],
      ),
    );
  }
}
