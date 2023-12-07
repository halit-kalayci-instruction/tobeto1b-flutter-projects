import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/screens/categories.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 255, 255, 0),
        brightness: Brightness.dark));

void main() {
  runApp(ProviderScope(child: MaterialApp(theme: theme, home: Categories())));
}
