import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/favorites_provider.dart';

class MealDetails extends ConsumerStatefulWidget {
  const MealDetails({super.key, required this.meal});
  final Meal meal;

  @override
  ConsumerState<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends ConsumerState<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteMealsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.name),
        actions: [
          IconButton(
              onPressed: () {
                ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavorite(widget.meal);
              },
              icon: Icon(favorites.contains(widget.meal)
                  ? Icons.favorite
                  : Icons.favorite_border))
        ],
      ),
    );
  }
}
