import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  Review(
      {this.id,
      this.review,
      this.username,
      this.profilePictureURL,
      this.rating,
      this.date,
      this.userLikes,
      this.comments});

  final String id;
  final String review;
  final String username;
  final String profilePictureURL;
  final double rating;
  final DateTime date;
  final Map<String, String> userLikes; // uids : usernames
  final List<String> comments;

  Map<String, dynamic> toMap() {
    return {
      'review': review,
      'username': username,
      'profilePictureURL': profilePictureURL,
      'rating': rating,
      'date': date,
      'userLikes': userLikes,
      'comments': comments,
    };
  }

  factory Review.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    final String review = data['review'];
    final String username = data['username'];
    final String profilePictureURL = data['profilePictureURL'];
    final double rating =
        (data['rating'] == null) ? data['rating'] : data['rating'].toDouble();
    final DateTime date = (data['date'] as Timestamp).toDate();
    final Map<String, String> userLikes = Map.from(data['userLikes']);
    final List<String> comments = List.from(data['comments']);

    return Review(
      id: documentId,
      review: review,
      username: username,
      profilePictureURL: profilePictureURL,
      rating: rating,
      date: date,
      userLikes: userLikes,
      comments: comments,
    );
  }
}
