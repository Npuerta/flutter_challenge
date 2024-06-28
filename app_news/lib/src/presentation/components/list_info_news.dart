import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/presentation/components/custom_circular_progress_indicator.dart';
import 'package:app_news/src/presentation/components/info_new.dart';
import 'package:flutter/material.dart';

class ListInfoNews extends StatelessWidget {
  const ListInfoNews({super.key, required this.articles});
  final List<ArticleEntitie> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (articles.length == index) {
            return CustomCircularProgressIndicator();
          } else {
            final ArticleEntitie article = articles[index];
            return 
              InfoNew(
                article: article,
              );
            
          }
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 15);
        },
        itemCount: articles.length);
  }
}
