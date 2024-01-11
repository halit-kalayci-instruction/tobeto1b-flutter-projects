import 'package:firebase_core/firebase_core.dart';
import 'package:firebaselesson/firebase_options.dart';
import 'package:firebaselesson/screens/auth.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MaterialApp(
    home: Scaffold(body: Auth()),
  ));
}
