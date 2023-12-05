import 'package:flutter/material.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';

const categoryList = [
  Category(id: "1", name: "Başlangıçlar", color: Colors.purple),
  Category(id: "2", name: "Ara Sıcaklar", color: Colors.red),
  Category(id: "3", name: "Ana Yemekler", color: Colors.blueGrey),
  Category(id: "4", name: "Tatlılar", color: Colors.limeAccent),
];

const mealList = [
  Meal(
      id: "1",
      categoryId: "1",
      name: "Mercimek Çorbası",
      imageUrl:
          "https://cdn.yemek.com/mnresize/940/940/uploads/2014/06/mercimek-corbasi-yemekcom.jpg",
      ingredients: ["Malzeme 1", "Malzeme 2", "Malzeme 3"]),
  Meal(
      id: "2",
      categoryId: "4",
      name: "Katmer",
      imageUrl:
          "https://gulumoglubaklava.com.tr/wp-content/uploads/292c2709-1626-4278-8589-fd456ae44468.jpg",
      ingredients: ["Malzeme 1", "Malzeme 2", "Malzeme 3"]),
];
