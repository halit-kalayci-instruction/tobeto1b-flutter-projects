// Notifier-Provider

// Notifier'ın oluşturulması
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';

// initial state
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavorite(Meal meal) {
    // state immutable
    // replace

    // if (state.contains(meal)) {
    //   state.remove(meal);
    // } else {
    //   state.add(meal);
    // }

    if (state.contains(meal)) {
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      // ... => spread operator
      state = [...state, meal];
    }
  }
}

// Provider'ın oluşturulması
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});

// boilerplate