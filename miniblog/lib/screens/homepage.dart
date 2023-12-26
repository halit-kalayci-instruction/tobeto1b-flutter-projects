import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_event.dart';
import 'package:miniblog/blocs/article_bloc/article_state.dart';
import 'package:miniblog/screens/add_blog.dart';
import 'package:miniblog/widgets/blog_item.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
              return ListView.builder(
                  itemCount: state.blogs.length,
                  itemBuilder: (context, index) =>
                      BlogItem(blog: state.blogs[index]));
            }

            return const Center(
              child: Text("Bilinmedik durum"),
            );
          },
        ));
  }
}
