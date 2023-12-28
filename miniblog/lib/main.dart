import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_bloc.dart';
import 'package:miniblog/blocs/article_detail_bloc/article_detail_bloc.dart';
import 'package:miniblog/repositories/article_repository.dart';
import 'package:miniblog/screens/homepage.dart';

void main() {
  final articleRepo = ArticleRepository();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<ArticleBloc>(
      create: (context) => ArticleBloc(
        articleRepository: articleRepo,
      ),
    ),
    BlocProvider<ArticleDetailBloc>(
      create: (context) => ArticleDetailBloc(
        articleRepository: articleRepo,
      ),
    )
  ], child: const MaterialApp(home: Homepage())));
}
