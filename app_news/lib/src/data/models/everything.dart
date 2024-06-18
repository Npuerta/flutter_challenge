import 'package:app_news/src/data/models/article.dart';

class Everything {
    final String? status;
    final int? totalResults;
    final List<Article> articles;

    Everything({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

  factory Everything.fromJson(Map<String, dynamic> json) => Everything(
        status: json['status'],
        totalResults: json['totalResults'] ,
        articles: List<Article>.from(
          (json['articles'] as List<dynamic>).map(
            (article) => Article.fromJson(article),
          ),
        ),
      );
}
