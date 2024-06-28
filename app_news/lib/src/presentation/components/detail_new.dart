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
      padding: const EdgeInsets.only( bottom: 5, left: 5,right: 5, top: 10),
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 90,
                padding: EdgeInsets.all(5),
                child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    article.title??'---',
                    style: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 233, 226, 226),
                          fontWeight: FontWeight.bold,
                        ),),
              ),
              ImageDetail(
                urlImage: article.urlToImage,
                source: article.source??'---',
                day: day,
                minWidth: 100,
                maxWidth: 500,
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
                          color: const Color.fromARGB(255, 233, 226, 226),
                        ),
                        text: article.description??'---'),
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
                          color: const Color.fromARGB(255, 243, 237, 237),
                        ),
                        text: article.content??'---'),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Escrito por : ',
                                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 47, 8, 239)),
                  ),
                  Text(
                    article.author??'---',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 75, 42, 239)),
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
                        color:  const Color.fromARGB(255, 9, 123, 104),
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
                        color: const Color.fromARGB(255, 2, 126, 7),
                        decoration: TextDecoration.underline,
                      ),
                      text: article.url??'---',
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
