import 'package:kanpai/app/home/models/comment.dart';

class Review {
  Review(
      {this.review,
      this.username,
      this.profilePictureURL,
      this.rating,
      this.date,
      this.userLikes,
      this.comments});

  final String review;
  final String username;
  final String profilePictureURL;
  final double rating;
  final DateTime date;
  final Map<String, String> userLikes; // uids : usernames
  final List<Comment> comments;

  Map<String, dynamic> toMap() {
    return {
      'review': review,
      'username': username,
      'rating': rating,
      'profilePictureURL': profilePictureURL,
      'date': date,
      'likesIds': userLikes,
      'comments': comments,
    };
  }
}
