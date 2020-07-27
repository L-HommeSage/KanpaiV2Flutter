import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:kanpai/app/home/models/comment.dart';
import 'package:kanpai/app/home/models/review.dart';
import 'package:kanpai/services/api_path.dart';

abstract class Database {
  Future<void> createReviewEn({Review review, String sakeId});
  Future<void> createReviewFr({Review review, String sakeId});
  Future<void> createReviewJp({Review review, String sakeId});
  void readSake();
  Future<void> createComment(
      {Comment comment, String sakeId, String lang, String reviewId});
}

class FireStoreDatabase implements Database {
  FireStoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  /// Read Sakes ///
  void readSake() {
    final path = APIPath.getSake(sakeId: "3256223100226");
    final reference = Firestore.instance.document(path);
    final snapshots = reference.snapshots();
    snapshots.listen(
      (snapshot) {
        print(snapshot.data);
      },
    );
  }

  /// Create Reviews ///
  Future<void> createReviewEn({Review review, String sakeId}) async =>
      await _setData(
        path: APIPath.sakeReviewEn(sakeId: sakeId),
        data: review.toMap(),
      );
  Future<void> createReviewFr({Review review, String sakeId}) async =>
      await _setData(
        path: APIPath.sakeReviewFr(sakeId: sakeId),
        data: review.toMap(),
      );
  Future<void> createReviewJp({Review review, String sakeId}) async =>
      await _setData(
        path: APIPath.sakeReviewJp(sakeId: sakeId),
        data: review.toMap(),
      );

  /// Create Comment ///
  Future<void> createComment(
          {Comment comment,
          String sakeId,
          String lang,
          String reviewId}) async =>
      await _setData(
        path: APIPath.sakeReviewComment(
            sakeId: sakeId, lang: lang, reviewId: reviewId),
        data: comment.toMap(),
      );

  /// Set Data ///
  Future<void> _setData({String path, Map<String, dynamic> data}) async {
    final reference = Firestore.instance.document(path);
    print('$path: $data');
    await reference.setData(data);
  }

  /// Generic Stream reader ///
   Stream<List<T>> _collectionStream<T>(
  {@required String path, @required T builder(Map<String,dynamic>data),}
    ){
    final reference = Firestore.instance.collection(path);
    final snapshots = reference.snapshots();
   }
}
