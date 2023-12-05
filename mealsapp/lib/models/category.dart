import 'package:flutter/material.dart';

class Category {
  // opsiyonel ctor parametreleri
  // kullanıcı 3. parametre (color) verirse verdiği coloru vermez ise default değeri (orange) kullan.
  const Category(
      {required this.id, required this.name, this.color = Colors.orange});

  final String id;
  final String name;
  final Color color;
}
