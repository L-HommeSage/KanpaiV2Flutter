class Comment {
  Comment({this.id, this.comment, this.profilePictureURL, this.date});
  final String id;
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

  factory Comment.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }

    final String comment = data['comment'];
    final String profilePictureURL = data['profilePictureURL'];
    final DateTime date = data['date'];

    return Comment(
      id: documentId,
      comment: comment,
      profilePictureURL: profilePictureURL,
      date: date,
    );
  }
}
