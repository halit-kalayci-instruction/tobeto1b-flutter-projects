import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniblog/blocs/article_detail_bloc/article_detail_event.dart';
import 'package:miniblog/blocs/article_detail_bloc/article_detail_state.dart';
import 'package:miniblog/repositories/article_repository.dart';

class ArticleDetailBloc extends Bloc<ArticleDetailEvent, ArticleDetailState> {
  final ArticleRepository articleRepository;

  ArticleDetailBloc({required this.articleRepository})
      : super(ArticleDetailInitial()) {
    on<FetchArticleDetailEvent>(_onFetchArticleDetail);
    on<ResetFetchArticleDetail>(_onReset);
  }

  void _onFetchArticleDetail(
      FetchArticleDetailEvent event, Emitter<ArticleDetailState> emit) async {
    emit(ArticleDetailLoading());
    try {
      final blog = await articleRepository.fetchBlogById(event.id);
      emit(ArticleDetailLoaded(blog: blog));
    } catch (e) {
      emit(ArticleDetailError());
    }
  }

  void _onReset(
      ResetFetchArticleDetail event, Emitter<ArticleDetailState> emit) async {
    emit(ArticleDetailInitial());
  }
}
