import 'package:app_news/src/data/models/autocom_collection.dart';
import 'package:app_news/src/domain/entities/autocom_collection_entitie.dart';
import 'package:app_news/src/domain/mapped/Autocom_data_mapped.dart';


class AutocomCollectionMapped {
  static AutocomCollectionEntitie mapped(AutocomCollection docs) => AutocomCollectionEntitie(
      data: docs.listData
          .map((source) => AutocomDataMapped.mapped(source))
          .toList());
}
