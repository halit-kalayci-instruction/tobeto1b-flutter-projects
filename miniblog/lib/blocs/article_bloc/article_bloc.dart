import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_bloc/article_event.dart';
import 'package:miniblog/blocs/article_bloc/article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticlesInitial()) {
    on<FetchArticles>(_onFetch);

    on<AddArticle>(_onAdd);
  }

  void _onFetch(FetchArticles event, Emitter<ArticleState> emit) {
    emit(ArticlesLoading());

    // ...
  }

  void _onAdd(AddArticle event, Emitter<ArticleState> emit) {}
}
