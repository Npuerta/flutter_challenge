import 'package:app_news/global/pages_router.dart';
import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/presentation/components/image_detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';


class InfoNew extends StatelessWidget{
 const InfoNew({super.key, required this.article});

final ArticleEntitie article;

  @override
  Widget build(BuildContext context) {
  final date = DateTime.parse(article.publishedAt!);
  final String day = DateFormat.yMMMMEEEEd().format(date);
  
   return  SizedBox(
    width: (MediaQuery.of(context).size.width)/2,
    child: GestureDetector(
      onTap: (){
          context.push(
           PagesRouter.detailNews,
           extra: article
          );
      },
      child: Column(
        children: [
          Container(
            height: 80,
            padding: EdgeInsets.all(5),
            child: Text(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              article.title!),
          ),
          ImageDetail(
            urlImage: article.urlToImage,
            source: article.source!,
            minWidth: 100,
            maxWidth: 300,
            day: day,     
            ),
        ],
      ),
    ),
   );
  }
  
}