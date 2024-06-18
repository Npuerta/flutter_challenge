import 'package:app_news/src/data/models/article.dart';

class TopHeadlines {
    final String? status;
    final int? totalResults;
    final List<Article> articles;

    TopHeadlines({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

  factory TopHeadlines.fromJson(Map<String, dynamic> json) => TopHeadlines(
        status: json['status'],
        totalResults: json['totalResults'] ,
        articles: List<Article>.from(
          (json['articles'] as List<dynamic>).map(
            (article) => Article.fromJson(article),
          ),
        ),
      );
}
