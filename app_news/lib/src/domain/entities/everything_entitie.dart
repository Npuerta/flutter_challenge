
import 'package:app_news/src/domain/entities/article_entitie.dart';


class EverythingEntitie {
    final List<ArticleEntitie>? articles;
    final String? returnMessage;

    EverythingEntitie({
        this.articles,
        this.returnMessage
    });

//  factory EverythingEntitie.fromEverything(Everything every) =>
//       EverythingEntitie(
//         articles: every.articles,
//       );


}