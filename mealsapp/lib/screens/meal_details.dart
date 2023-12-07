import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
        ],
      ),
    );
  }
}
