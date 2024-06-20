import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/presentation/components/image_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class InfoNew extends StatelessWidget{
 const InfoNew({super.key, required this.item});

final ArticleEntitie item;

  @override
  Widget build(BuildContext context) {
  final date = DateTime.parse(item.publishedAt!);
  final String day = DateFormat.yMMMMEEEEd().format(date);
  
   return  SizedBox(
    width: (MediaQuery.of(context).size.width)/2,
    child: Column(
      children: [
        Center(
          child: Text(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            item.title!),
        ),
        ImageDetail(
          urlImage: item.urlToImage,
          source: item.source!,
          day: day,     
          ),
      ],
    ),
   );
  }
  
}