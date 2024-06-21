import 'package:app_news/src/domain/entities/article_entitie.dart';
import 'package:app_news/src/presentation/components/image_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailNew extends StatelessWidget {
  const DetailNew({super.key, required this.article});

  final ArticleEntitie article;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(article.publishedAt!);
    final String day = DateFormat.yMMMMEEEEd().format(date);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListView(
        children: [
          Column(
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
                day: day,
                minWidth: 100,
                maxWidth: 500,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        text: article.description),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        text: article.content),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text('Escrito por : '),
                  Text(
                    article.author!,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 25, 61, 8)),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 30, 3, 185),
                      ),
                      text: 'Mas informacion visita',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 60, 43, 160),
                        decoration: TextDecoration.underline,
                      ),
                      text: article.url,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}
