import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/presentation/components/list_info_news.dart';
import 'package:flutter/material.dart';

class resultArticles extends StatelessWidget {
  const resultArticles({
    super.key,
    required this.articles,
  });

  final List<ArticleEntitie>? articles;

  @override
  Widget build(BuildContext context) {
   if(articles!.isEmpty == true) return Text('NO se encotraron resulatdos');
    return Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 300, minHeight: 280, maxHeight: 340 ),
        child: ListInfoNews(
          articles: articles!,
        ));
  }
}
