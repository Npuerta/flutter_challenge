import 'package:app_news/global/custom_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseApi {

    Future<List<QueryDocumentSnapshot>> getWords(String collectionName) async {
    try {
      CollectionReference data =
          FirebaseFirestore.instance.collection(collectionName);
      List<QueryDocumentSnapshot> docs=[];
      
      await data
          .get()
          .then((QuerySnapshot querySnapshot) {
        docs = querySnapshot.docs; 
      });

    return docs;
    } catch (e, s) {
      throw CustomException(
          messageUser: 'Error en getWords FirebaseApi',
          internalErrorCode: '10-${e.hashCode}',
          internalErrorMessage: '',
          stackTrace: s);
    }
  }

  Future<List<String>> getWordsByLanguage(String collectionName, String language) async {
    try {
      CollectionReference data =
          FirebaseFirestore.instance.collection(collectionName);
      List<String> options = [];

      await data
          .where('language', isEqualTo: language)
          .get()
          .then((QuerySnapshot querySnapshot) {
        var doc = querySnapshot.docs.first;
        List result = doc["data"];
        options = result.map((val) => val as String).toList();
      });

      return options;
    } catch (e, s) {
      throw CustomException(
          messageUser: 'Error en getWords FirebaseApi',
          internalErrorCode: '10-${e.hashCode}',
          internalErrorMessage: '',
          stackTrace: s);
    }
  }
}
