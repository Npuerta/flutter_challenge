import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/presentation/components/image_detail.dart';
import 'package:flutter/material.dart';

class DetailNew extends StatelessWidget{
 const DetailNew({super.key, required this.item});

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
          urlImage: item.urlToImage!,
          source: item.source!,
          day: item.publishedAt!,     
          ),
          const SizedBox(width: 10,),
          Text(item.description!, maxLines: 3, overflow: TextOverflow.ellipsis,),
          const SizedBox(width: 10,),
          Text(item.content!, maxLines: 6,overflow: TextOverflow.ellipsis),
          const SizedBox(width: 10,),
          Row(
            children: [
              const Text('Escrito por : '),
              Text(item.author!),
            ],
          ),
          const SizedBox(width: 10,),
          const Text('Mas informacion visita'),
          const SizedBox(width: 10,),
          Text(item.url!),
      ],
    ),
   );
  }
  
}