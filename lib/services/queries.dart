import 'package:cloud_firestore/cloud_firestore.dart';

class Queries {
  getSakesList({String searchField, dynamic query}) {
    if (searchField == "pairings" || searchField == "characteristics") {
      return Firestore.instance
          .collection("sakes")
          .where(searchField, arrayContains: query)
          .getDocuments();
    } else {
      return Firestore.instance
          .collection("sakes")
          .where(searchField, isEqualTo: query)
          .getDocuments();
    }
  }
}
