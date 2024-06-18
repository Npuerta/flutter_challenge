import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/presentation/components/image_detail.dart';
import 'package:flutter/material.dart';

class InfoNew extends StatelessWidget{
 const InfoNew({super.key, required this.item});

final ArticleEntitie item;

  @override
  Widget build(BuildContext context) {
   return  Padding(
    padding: const EdgeInsets.all(5),
    child: Column(
      children: [
        Center(
          child: Text(item.title!),
        ),
        ImageDetail(
          urlImage: item.urlToImage,
          source: item.source!,
          day: item.publishedAt!,     
          ),
      ],
    ),
   );
  }
  
}