import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_detail_bloc/article_detail_bloc.dart';
import 'package:miniblog/blocs/article_detail_bloc/article_detail_event.dart';
import 'package:miniblog/blocs/article_detail_bloc/article_detail_state.dart';

class BlogDetail extends StatefulWidget {
  const BlogDetail({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  _BlogDetailState createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ArticleDetailBloc>().add(ResetFetchArticleDetail());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detay Sayfası")),
      body: BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
        builder: (context, state) {
          if (state is ArticleDetailInitial) {
            context
                .read<ArticleDetailBloc>()
                .add(FetchArticleDetailEvent(id: widget.id));
            return const Center(child: Text("İstek atılıyor.."));
          }

          if (state is ArticleDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ArticleDetailLoaded) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(state.blog.thumbnail!),
                  Text(state.blog.title!),
                  Text(state.blog.content!)
                ],
              ),
            );
          }

          return const Center(
            child: Text("Bilinmedik durum"),
          );
        },
      ),
    );
  }
}
