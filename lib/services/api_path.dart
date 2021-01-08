import 'package:flutter/cupertino.dart';

class APIPath {
  /// Get Sake ///
  static String getSake({String sakeId}) => '/sakes/$sakeId';

  /// Sake Descriptions ///
  static String sakeDescriptionEn({String sakeId}) =>
      '/sakes/$sakeId/descriptions/en';
  static String sakeDescriptionFr({String sakeId}) =>
      '/sakes/$sakeId/descriptions/fr';
  static String sakeDescriptionJp({String sakeId}) =>
      '/sakes/$sakeId/descriptions/jp';

  /// Sake Reviews ///
  static String sakeReviewEn(
          {@required String sakeId, @required String reviewId}) =>
      '/sakes/$sakeId/reviews/en/reviews/$reviewId';
  static String sakeReviewFr(
          {@required String sakeId, @required String reviewId}) =>
      '/sakes/$sakeId/reviews/fr/reviews/$reviewId';
  static String sakeReviewJp(
          {@required String sakeId, @required String reviewId}) =>
      '/sakes/$sakeId/reviews/jp/reviews/$reviewId';

  /// Sake Reviews Comments///
  static String sakeReviewComment(
          {String sakeId, String lang, String reviewId}) =>
      '/sakes/$sakeId/reviews/$lang/reviewsContent/$reviewId/comments';

  /// get News ///
  static String getSakeNews({String lang, String id}) =>
      '/news/$lang/highlighted/highlighted$id';

  static String getEventNews({String lang, String id}) =>
      '/news/$lang/events/event$id';
}
