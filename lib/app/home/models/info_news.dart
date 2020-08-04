class InfoNews {
  InfoNews({this.title, this.id, this.message, this.photoUrl, this.colorCode});
  final String id;
  final String message;
  final String title;
  final String photoUrl;
  final int colorCode;

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'title': title,
      'photoUrl': photoUrl,
      'colorCode': colorCode,
    };
  }

  factory InfoNews.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }

    final String message = data['message'];
    final String title = data['title'];
    final String photoUrl = data['photoUrl'];
    final int colorCode = data['colorCode'];

    return InfoNews(
      id: documentId,
      message: message,
      title: title,
      photoUrl: photoUrl,
      colorCode: colorCode,
    );
  }
}
