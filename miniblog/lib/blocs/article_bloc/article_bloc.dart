import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_event.dart';
import 'package:miniblog/blocs/article_bloc/article_state.dart';
import 'package:http/http.dart' as http;
import 'package:miniblog/models/blog.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticlesInitial()) {
    on<FetchArticles>(_onFetch);

    on<AddArticle>(_onAdd);
  }

  void _onFetch(FetchArticles event, Emitter<ArticleState> emit) async {
    emit(ArticlesLoading());
    Uri url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");
    final response = await http.get(url);
    final List jsonData = json.decode(response.body);
    final List<Blog> blogs =
        jsonData.map((json) => Blog.fromJson(json)).toList();
    emit(ArticlesLoaded(blogs: blogs));
  }

  void _onAdd(AddArticle event, Emitter<ArticleState> emit) {}
}
