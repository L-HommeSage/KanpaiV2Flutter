import 'package:flutter/material.dart';
import 'package:kanpai/constants/style.dart';
import 'package:kanpai/services/auth.dart';
import 'package:kanpai/services/database.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton(
      {@required this.sakeId, @required this.database, @required this.user});
  final String sakeId;
  final Database database;
  final User user;
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmark = false;
  bool hasChanged = false;
  @override
  void initState() {
    if (widget.user.bookmarks.contains(widget.sakeId)) isBookmark = true;
    super.initState();
  }

  @override
  void dispose() {
    if (hasChanged) {
      print("triggered");
      if (widget.user.bookmarks.contains(widget.sakeId)) {
        widget.user.bookmarks.remove(widget.sakeId);
      } else {
        widget.user.bookmarks.add(widget.sakeId);
      }

      final CollectionReference collectionReference =
          Firestore.instance.collection("users");
      collectionReference.document(widget.user.uid).updateData(
          {"bookmarks": widget.user.bookmarks}).whenComplete(() async {
        print("Completed");
      }).catchError((e) => print(e));
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isBookmark = !isBookmark;
          hasChanged = !hasChanged;
        });
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text((isBookmark)
                ? S.of(context).added_bookmarks
                : S.of(context).removed_bookmarks)));
      },
      icon: Icon(
        (isBookmark) ? Icons.bookmark : Icons.bookmark_border,
        color: kPrimaryTextColor,
        size: 30,
      ),
    );
  }
}
