import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:kanpai/app/home/models/comment.dart';
import 'package:kanpai/app/home/models/review.dart';
import 'package:kanpai/services/api_path.dart';

abstract class Database {
  Future<void> createReviewEn({Review review, String sakeId});
  Future<void> createReviewFr({Review review, String sakeId});
  Future<void> createReviewJp({Review review, String sakeId});
  Future<void> createComment(
      {Comment comment, String sakeId, String lang, String reviewId});
}

class FiresStoreDatabase implements Database {
  FiresStoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

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
}
