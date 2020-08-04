class EventNews {
  EventNews(
      {this.title,
      this.eventUrl,
      this.id,
      this.message,
      this.photoUrl,
      this.colorCode});
  final String id;
  final String message;
  final String title;
  final String photoUrl;
  final String eventUrl;
  final int colorCode;

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'title': title,
      'photoUrl': photoUrl,
      'eventUrl': eventUrl,
      'colorCode': colorCode,
    };
  }

  factory EventNews.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }

    final String message = data['message'];
    final String title = data['title'];
    final String photoUrl = data['photoUrl'];
    final String eventUrl = data['eventUrl'];
    final int colorCode = data['colorCode'];

    return EventNews(
      id: documentId,
      message: message,
      title: title,
      photoUrl: photoUrl,
      eventUrl: eventUrl,
      colorCode: colorCode,
    );
  }
}
