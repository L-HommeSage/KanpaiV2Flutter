import 'package:flutter/foundation.dart';
import 'package:kanpai/app/home/models/comment.dart';
import 'package:kanpai/app/home/models/event_news.dart';
import 'package:kanpai/app/home/models/review.dart';
import 'package:kanpai/app/home/models/sake.dart';
import 'package:kanpai/app/home/models/sake_news.dart';
import 'package:kanpai/services/api_path.dart';
import 'package:kanpai/services/firestore_service.dart';

abstract class Database {
  Stream<SakeNews> sakeNewsStream(String lang, String id);
  Stream<EventNews> eventNewsStream(String lang, String id);
  Future<void> setReviewEn(
      {Review review,
      String sakeId}); // can be used for update or create a review in english
  Future<void> setReviewFr(
      {Review review, String sakeId}); // same but in french
  Future<void> setReviewJp(
      {Review review, String sakeId}); // same but in japanese
  Stream<Sake> sakeStream(String sakeId);
  Stream<Sake> sakeDescriptionStreamEn(String sakeId);
  Stream<Sake> sakeDescriptionStreamFr(String sakeId);
  Stream<Sake> sakeDescriptionStreamJp(String sakeId);
  //void readSake();
  Future<void> setComment(
      {Comment comment, String sakeId, String lang, String reviewId});
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FireStoreDatabase implements Database {
  FireStoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;
  final _service = FirestoreService.instance;

  /// Read SakeNews ///
  Stream<SakeNews> sakeNewsStream(String lang, String id) =>
      _service.documentStream(
          path: APIPath.getSakeNews(lang: lang, id: id),
          builder: (data, id) => SakeNews.fromMap(data, id));

  /// Read EventNews ///
  Stream<EventNews> eventNewsStream(String lang, String id) =>
      _service.documentStream(
          path: APIPath.getEventNews(lang: lang, id: id),
          builder: (data, id) => EventNews.fromMap(data, id));

  /// Read Sake Stream methods///
  Stream<Sake> sakeStream(String sakeId) => _service.documentStream(
        path: APIPath.getSake(sakeId: sakeId),
        builder: (data, sakeId) => Sake.fromMap(data, sakeId),
      );

  Stream<Sake> sakeDescriptionStreamEn(String sakeId) =>
      _service.documentStream(
        path: APIPath.sakeDescriptionEn(sakeId: sakeId),
        builder: (data, sakeId) => Sake.getDescription(data, sakeId),
      );

  Stream<Sake> sakeDescriptionStreamFr(String sakeId) =>
      _service.documentStream(
        path: APIPath.sakeDescriptionFr(sakeId: sakeId),
        builder: (data, sakeId) => Sake.getDescription(data, sakeId),
      );

  Stream<Sake> sakeDescriptionStreamJp(String sakeId) =>
      _service.documentStream(
        path: APIPath.sakeDescriptionJp(sakeId: sakeId),
        builder: (data, sakeId) => Sake.getDescription(data, sakeId),
      );

  /// Read Reviews ///
  // Stream<List<Review>> reviewsEnStream(String sakeId) =>
  //     _service.collectionStream(
  //       path: APIPath.sakeReviewEn(sakeId: sakeId),
  //       builder: (data, documentId) => Review.fromMap(data, documentId),
  //     );

  /// Create Reviews ///
  Future<void> setReviewEn({Review review, String sakeId}) async =>
      await _service.setData(
        path: APIPath.sakeReviewEn(
            sakeId: sakeId, reviewId: documentIdFromCurrentDate()),
        data: review.toMap(),
      );
  Future<void> setReviewFr({Review review, String sakeId}) async =>
      await _service.setData(
        path: APIPath.sakeReviewFr(
            sakeId: sakeId, reviewId: documentIdFromCurrentDate()),
        data: review.toMap(),
      );
  Future<void> setReviewJp({Review review, String sakeId}) async =>
      await _service.setData(
        path: APIPath.sakeReviewJp(
            sakeId: sakeId, reviewId: documentIdFromCurrentDate()),
        data: review.toMap(),
      );

  /// Create Comment ///
  Future<void> setComment(
          {Comment comment,
          String sakeId,
          String lang,
          String reviewId}) async =>
      await _service.setData(
        path: APIPath.sakeReviewComment(
            sakeId: sakeId, lang: lang, reviewId: reviewId),
        data: comment.toMap(),
      );
}
