abstract class ArticleDetailEvent {}

class FetchArticleDetailEvent extends ArticleDetailEvent {
  final String id;

  FetchArticleDetailEvent({required this.id});
}

class ResetFetchArticleDetail extends ArticleDetailEvent {}
