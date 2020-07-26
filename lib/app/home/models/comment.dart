class Comment {
  Comment({this.comment, this.profilePictureURL, this.date});

  final String comment;
  final String profilePictureURL;
  final DateTime date;

  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
      'profilePictureURL': profilePictureURL,
      'date': date,
    };
  }
}
