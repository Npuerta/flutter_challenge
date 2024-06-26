import 'package:app_news/src/data/models/condition.dart';
import 'package:app_news/src/domain/entities/condition_entitie.dart';

class ConditionMapped {

  static ConditionEntitie mapped(Condition condition)=> ConditionEntitie(
    icon: condition.icon,
    text: condition.text
  );
}