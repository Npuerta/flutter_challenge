import 'package:app_news/src/data/models/everything.dart';
import 'package:app_news/src/domain/entities/everything_entitie.dart';
import 'package:app_news/src/domain/mapped/article_mapped.dart';

class EverythingMapped {
  static EverythingEntitie mapped(Everything every) => EverythingEntitie(
        articles: every.articles
            .map((article) => ArticleMapped.mapped(article))
            .toList(),
      );
}
