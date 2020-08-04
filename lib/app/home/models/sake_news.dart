class SakeNews {
  SakeNews({this.id, this.message, this.sakeId, this.colorCode});
  final String id;
  final String message;
  final String sakeId;
  final int colorCode;

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'sakeId': sakeId,
      'colorCode': colorCode,
    };
  }

  factory SakeNews.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }

    final String message = data['message'];
    final String sakeId = data['sakeId'];
    final int colorCode = data['colorCode'];

    return SakeNews(
      id: documentId,
      message: message,
      sakeId: sakeId,
      colorCode: colorCode,
    );
  }
}
