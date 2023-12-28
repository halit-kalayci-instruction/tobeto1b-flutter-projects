import 'package:miniblog/models/blog.dart';

abstract class ArticleDetailState {}

class ArticleDetailInitial extends ArticleDetailState {}

class ArticleDetailLoading extends ArticleDetailState {}

class ArticleDetailLoaded extends ArticleDetailState {
  final Blog blog;

  ArticleDetailLoaded({required this.blog});
}

class ArticleDetailError extends ArticleDetailState {}
