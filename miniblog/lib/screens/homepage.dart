import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_event.dart';
import 'package:miniblog/blocs/article_bloc/article_state.dart';
import 'package:miniblog/screens/add_blog.dart';
import 'package:miniblog/widgets/blog_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool darkMode = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDarkMode();
    setJson();
    getJson();
  }

  void setJson() async {
    Map<String, dynamic> json = {
      'name': 'Halit Enes',
      'surname': "Kalaycı",
      'age': 25
    };
    final sharedPrefs = await SharedPreferences.getInstance();
    final jsonAsString = jsonEncode(json);
    sharedPrefs.setString("user", jsonAsString);
  }

// 15:00
  void getJson() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final jsonAsString = sharedPrefs.getString("user");
    Map<String, dynamic> json = jsonDecode(jsonAsString!);
  }

  void getDarkMode() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final isDarkMode = sharedPrefs.getBool("darkMode");
    if (isDarkMode != null) {
      setState(() {
        darkMode = isDarkMode;
      });
    }
  }

  void onDarkModeChange(bool value) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool("darkMode", value);
    setState(() {
      darkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Blog Listesi"),
          actions: [
            IconButton(
                onPressed: () async {
                  bool? result = await Navigator.of(context)
                      .push(MaterialPageRoute(builder: (builder) => AddBlog()));

                  if (result == true) {
                    //fetchBlogs();
                  }
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticlesInitial) {
              context.read<ArticleBloc>().add(FetchArticles());

              return const Center(
                child: Text("İstek atılıyor.."),
              );
            }

            if (state is ArticlesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ArticlesError) {
              return const Center(
                child: Text("İstek hatalı.."),
              );
            }

            if (state is ArticlesLoaded) {
              return Column(
                children: [
                  Switch(
                      value: darkMode,
                      onChanged: (value) {
                        onDarkModeChange(value);
                      }),
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.blogs.length,
                        itemBuilder: (context, index) =>
                            BlogItem(blog: state.blogs[index])),
                  ),
                ],
              );
            }

            return const Center(
              child: Text("Bilinmedik durum"),
            );
          },
        ));
  }
}
