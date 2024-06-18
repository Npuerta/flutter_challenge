
import 'package:app_news/src/data/models/headlines_source.dart';
import 'package:app_news/src/domain/entities/headlines_source_entitie.dart';

class HeadlinesSourceMapped {
  static HeadlinesSourceEntitie mapped(HeadlinesSource hSource) =>
      HeadlinesSourceEntitie(
        category: hSource.category,
        description: hSource.description,
        id: hSource.id,
        name: hSource.name,
        url: hSource.url,
      );
}
