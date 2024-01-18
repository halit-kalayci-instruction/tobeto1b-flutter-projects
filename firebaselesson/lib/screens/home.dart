import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseStorageInstance = FirebaseStorage.instance;
final firebaseFireStore = FirebaseFirestore.instance;
final fcm = FirebaseMessaging.instance;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _selectedImage;

  @override
  void initState() {
    _requestNotificationPermission();
    super.initState();
  }

  void _requestNotificationPermission() async {
    NotificationSettings settings = await fcm.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await fcm.getToken();
      print(token);
    }
  }

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
      User? loggedInUser = firebaseAuthInstance.currentUser;

      final storageRef = firebaseStorageInstance
          .ref()
          .child("images")
          .child("${loggedInUser!.uid}.jpg");

      await storageRef.putFile(_selectedImage!);

      final url = await storageRef.getDownloadURL();

      await firebaseFireStore
          .collection("users")
          .doc(loggedInUser.uid)
          .update({'imageUrl': url});
    }
  }

  Future<String> _getUserImage() async {
    User? loggedInUser = firebaseAuthInstance.currentUser;
    final document =
        firebaseFireStore.collection("users").doc(loggedInUser!.uid);
    final documentSnapshot = await document.get();

    final imageUrl = await documentSnapshot.get("imageUrl");

    return imageUrl;
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
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            const SizedBox(height: 30),
            if (_selectedImage == null)
              FutureBuilder(
                  future: _getUserImage(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          foregroundImage: NetworkImage(snapshot.data!));
                    }
                    if (snapshot.hasError) {
                      return const Text("Avatar yüklenirken bir hata oluştu..");
                    }
                    return const CircularProgressIndicator();
                  }),
            if (_selectedImage != null)
              CircleAvatar(
                  radius: 40, foregroundImage: FileImage(_selectedImage!)),
            TextButton(
                onPressed: () {
                  _pickImage();
                },
                child: const Text("Resim Seç")),
            if (_selectedImage != null)
              ElevatedButton(
                  onPressed: () {
                    _uploadImage();
                  },
                  child: const Text("Yükle"))
          ]),
        ],
      ),
    );
  }
}
