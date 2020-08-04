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
  static String sakeReviewEn({String sakeId}) => '/sakes/$sakeId/reviews/en';
  static String sakeReviewFr({String sakeId}) => '/sakes/$sakeId/reviews/fr';
  static String sakeReviewJp({String sakeId}) => '/sakes/$sakeId/reviews/jp';

  /// Sake Reviews Comments///
  static String sakeReviewComment(
          {String sakeId, String lang, String reviewId}) =>
      '/sakes/$sakeId/reviews/$lang/reviewsContent/$reviewId/comments';

  /// get News ///
  static String getSakeNews({String lang, String id}) =>
      '/news/$lang/highlighted/highlighted$id';
}
