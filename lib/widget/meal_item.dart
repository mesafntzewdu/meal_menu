import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screens/meals_details.dart';
import 'package:meals/widget/meal_traits.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget {
  const MealsItem({super.key, required this.meal, required this.onFavToggle});
  final Function(Meal meal) onFavToggle;

  final Meal meal;

  String get getWorkLoad {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get getPriceTag {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  void getIntoDetail(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MealDetail(
            meal: meal,
            onFavToggle: onFavToggle,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          getIntoDetail(context);
        },
        child: Stack(
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: meal.imageUrl,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              top: 178,
              child: Container(
                decoration: const BoxDecoration(color: Colors.black54),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealTraits(
                          icon: Icons.schedule,
                          title: '${meal.duration} min',
                        ),
                        MealTraits(
                          icon: Icons.work,
                          title: getWorkLoad,
                        ),
                        MealTraits(
                          icon: Icons.price_check_outlined,
                          title: getPriceTag,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
