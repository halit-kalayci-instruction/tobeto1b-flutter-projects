import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseStorageInstance = FirebaseStorage.instance;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _selectedImage;

  void _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void _uploadImage() async {
    if (_selectedImage != null) {
      // uuid, userid
      final storageRef =
          firebaseStorageInstance.ref().child("images").child("image1.jpg");

      await storageRef.putFile(_selectedImage!);

      final url = await storageRef.getDownloadURL();
      print(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase App"), actions: [
        IconButton(
            onPressed: () {
              firebaseAuthInstance.signOut();
            },
            icon: const Icon(Icons.logout))
      ]),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 40,
            foregroundImage:
                _selectedImage != null ? FileImage(_selectedImage!) : null,
          ),
          TextButton(
              onPressed: () {
                _pickImage();
              },
              child: const Text("Resim Seç")),
          ElevatedButton(
              onPressed: () {
                _uploadImage();
              },
              child: const Text("Yükle"))
        ]),
      ),
    );
  }
}
