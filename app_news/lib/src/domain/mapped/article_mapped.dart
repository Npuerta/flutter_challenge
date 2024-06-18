import 'package:app_news/src/data/models/article.dart';
import 'package:app_news/src/domain/entities/article_entitie.dart';

class ArticleMapped {
  static ArticleEntitie mapped(Article article) => ArticleEntitie(
        author: article.author,
        source: article.source.name,
        content: article.content,
        description: article.description,
        publishedAt: article.publishedAt,
        title: article.title,
        url: article.url,
        urlToImage: article.urlToImage,
      );
}
