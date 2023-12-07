import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';

final mealsProvider = Provider((ProviderRef ref) {
  return const [
    Meal(
        id: "2",
        categoryId: "4",
        name: "Katmer",
        imageUrl:
            "https://gulumoglubaklava.com.tr/wp-content/uploads/292c2709-1626-4278-8589-fd456ae44468.jpg",
        ingredients: ["Malzeme 1", "Malzeme 2", "Malzeme 3"]),
  ];
});

// Read-Only Provider