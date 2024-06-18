import 'package:app_news/src/data/models/headlines.dart';
import 'package:app_news/src/domain/entities/headlines_entitie.dart';
import 'package:app_news/src/domain/mapped/headlines_source_mapped.dart';



class HeadlinesMapped {
  static HeadlinesEntitie mapped(Headlines headLine) => HeadlinesEntitie(
      sources: headLine.sources
          .map((source) => HeadlinesSourceMapped.mapped(source))
          .toList());
}
