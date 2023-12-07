import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/meal_details.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => MealDetails(meal: meal)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(meal.name),
        ),
      ),
    );
  }
}
