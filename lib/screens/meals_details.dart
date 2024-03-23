import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
      ),
      body: Column(
        children: [
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: meal.imageUrl,
          ),
        ],
      ),
    );
  }
}
