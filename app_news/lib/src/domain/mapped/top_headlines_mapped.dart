import 'package:app_news/src/data/models/top_headlines.dart';
import 'package:app_news/src/domain/entities/top_headlines_entitie.dart';
import 'package:app_news/src/domain/mapped/article_mapped.dart';

class TopHeadlinesMapped {
  static TopHeadlinesEntitie mapped(TopHeadlines topHead) =>
      TopHeadlinesEntitie(
        articles: topHead.articles
            .map((article) => ArticleMapped.mapped(article))
            .toList(),
      );
}
