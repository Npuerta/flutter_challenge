
import 'package:app_news/src/data/models/autocom_data.dart';
import 'package:app_news/src/domain/entities/autocom_data_entitie.dart';


class AutocomDataMapped {
  static AutocomDataEntitie mapped(AutocomData doc) => AutocomDataEntitie(
        language: doc.language,
        options: doc.data,
      );
}
