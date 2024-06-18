import 'package:app_news/src/data/models/headlines_source.dart';

class Headlines {
final String status;
final List<HeadlinesSource> sources;

Headlines({
  required this.status,
  required this.sources
});

  factory Headlines.fromJson(Map<String, dynamic> json) => Headlines(
        status: json['status'],
        sources: List<HeadlinesSource>.from(
          (json['sources'] as List<dynamic>).map(
            (source) => HeadlinesSource.fromJson(source),
          ),
        ),
      );

}