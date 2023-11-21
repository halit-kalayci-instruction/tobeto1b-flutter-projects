import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

ColorScheme colorScheme1 =
    ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme1,
          appBarTheme: AppBarTheme(
              backgroundColor: colorScheme1.onPrimaryContainer,
              foregroundColor: colorScheme1.primaryContainer),
          cardTheme: CardTheme(
            color: colorScheme1.onPrimaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                bodyMedium: TextStyle(),
              )),
      home: const MainPage(),
    ),
  );
}
// Uygulamanıza bir renk paleti oluşturmak ve global theme kuralları uygulamak
// ARAŞTIRMA VE UYGULAMA
// Silme işleminde bir snackbar gösterilmesi ve snackbarın undo butonuna tıklandığında silinen verinin
// geri getirilmesi..