import 'package:app_news/src/data/models/autocom_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AutocomCollection {

AutocomCollection({required this.listData});

final List<AutocomData> listData;

factory AutocomCollection.fromData(List<QueryDocumentSnapshot> docs) {
  List<AutocomData> result=[];
    docs.forEach((doc) {
      var xd = doc["data"] as List;
      var xl = doc["language"] as String;
      result.add(AutocomData.fromList(xd, xl)) ;
    }) ;

    return AutocomCollection(
      listData: result ,
    );
  }

}
