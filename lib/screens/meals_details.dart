import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/provider/favorites_provider.dart';

class MealDetail extends ConsumerWidget {
  const MealDetail({
    super.key,
    required this.meal,
  });
  final Meal meal;
  @override
  Widget build(context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Detail'),
        elevation: 2,
        actions: [
          IconButton(
              onPressed: () {
                var result = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealsList(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(result ? 'Meal added' : 'Meal removed'),
                    action: SnackBarAction(label: 'Undo', onPressed: () {}),
                  ),
                );
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
