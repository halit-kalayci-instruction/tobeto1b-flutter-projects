import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AddBlog extends StatefulWidget {
  const AddBlog({Key? key}) : super(key: key);

  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker imagePicker = ImagePicker();
  XFile? selectedImage;
  String title = "";
  String content = "";
  String author = "";

  submit() async {
    Uri url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");

    var request = http.MultipartRequest("POST", url);

    request.fields['Title'] = title;
    request.fields['Content'] = content;
    request.fields['Author'] = author;

    if (selectedImage != null) {
      final file =
          await http.MultipartFile.fromPath("File", selectedImage!.path);
      request.files.add(file);
    }

    final response = await request.send();

    if (response.statusCode == 201) {
      // Ekleme başarılı
      Navigator.pop(context, true);
    }
  }

  pickImage() async {
    XFile? selectedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = selectedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Yeni Blog Ekle")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                if (selectedImage != null)
                  Image.file(File(selectedImage!.path)),
                ElevatedButton(
                    onPressed: () {
                      pickImage();
                    },
                    child: const Text("Fotoğraf Seç")),
                TextFormField(
                  decoration:
                      const InputDecoration(label: Text("Blog Başlığı")),
                  onSaved: (newValue) {
                    title = newValue!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Lütfen bir blog başlığı giriniz";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(label: Text("Blog İçeriği")),
                  maxLines: 5,
                  onSaved: (newValue) {
                    content = newValue!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Lütfen bir blog içeriği giriniz";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Ad Soyad")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Lütfen ad soyadbaşlığı giriniz";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    author = newValue!;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // formun valid olduğu durum
                        _formKey.currentState!.save();
                        submit();
                      }
                    },
                    child: const Text("Blog Ekle"))
              ],
            ),
          ),
        ));
  }
}
