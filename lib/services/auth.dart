import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kanpai/generated/l10n.dart';

class User {
  User({
    @required this.uid,
    @required this.photoUrl,
    @required this.displayName,
    @required this.previousSearch,
    @required this.sakeList,
    @required this.bookmarks,
    @required this.myReviews,
    @required this.recommendedSearch,
  });
  final String uid;
  final String photoUrl;
  final String displayName;
  List previousSearch;
  List sakeList;
  List bookmarks;
  List myReviews;
  List recommendedSearch;
}

abstract class AuthBase {
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<User> signInWithGoogle();
  Future<User> signInWithEmail(String email, String pwd);
  Future<User> createUserWithEmail(String email, String pwd);
  Future<void> signOut();
  Stream<User> get onAuthStateChanged;
  Future<void> createRecord(FirebaseUser user);
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  final _databaseReference = Firestore.instance;

  User _userFromFirebase(FirebaseUser user) {
    List sakeList = [];
    List previousSearch = [];
    List bookmarks = [];
    List myReviews = [];
    List recommendedSearch = [];
    if (user == null) return null;
    return User(
      uid: user.uid,
      photoUrl: user.photoUrl,
      displayName: user.displayName,
      previousSearch: previousSearch,
      sakeList: sakeList,
      bookmarks: bookmarks,
      myReviews: myReviews,
      recommendedSearch: recommendedSearch,
    );
  }

  @override
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  @override
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  @override
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    createRecord(authResult.user);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<User> signInWithEmail(String email, String pwd) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: pwd);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<User> createUserWithEmail(String email, String pwd) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: pwd);
    createRecord(authResult.user);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.getCredential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        createRecord(authResult.user);
        return _userFromFirebase(authResult.user);
      } else {
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_TOKEN',
          message: 'Missing Google Auth Token',
        );
      }
    } else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> createRecord(FirebaseUser user) async {
    final docRef = _databaseReference.collection("users").document(user.uid);
    await docRef.get().then((value) {
      if (value.exists) {
        print(value.data);
      } else {
        docRef.setData({
          'previousSearch': [],
          'sakeList': [],
          'bookmarks': [],
          'myReviews': [],
          'recommendedSearch': [],
          'name':
              (user.displayName == null) ? S.current.visitor : user.displayName,
        });
      }
    });
  }
}
