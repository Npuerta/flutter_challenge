import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/presentation/components/info_new.dart';
import 'package:flutter/material.dart';


class ListInfoVerticalNews extends StatelessWidget {

  const ListInfoVerticalNews({super.key, required this.articles});
  final List<ArticleEntitie> articles;
  
  @override
  Widget build(BuildContext context) {
  return CustomScrollView(
    slivers: [
      SliverList(delegate: SliverChildBuilderDelegate(
        (context, int index) {
          if(index < articles.length){
          final ArticleEntitie article=articles[index];
          return InfoNew(item: article,);
          }
        }
      ),
      ),
    ],
  );

  }

}


