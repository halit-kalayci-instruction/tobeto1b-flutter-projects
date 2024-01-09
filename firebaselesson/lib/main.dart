import 'package:firebase_core/firebase_core.dart';
import 'package:firebaselesson/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MaterialApp(
    home: Scaffold(body: Text("Merhaba")),
  ));
}
