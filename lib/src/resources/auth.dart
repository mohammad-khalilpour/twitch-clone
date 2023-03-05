import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitch_clone/src/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  model.User? _user;

  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
    Uint8List? file,
  }) async {
    String res = "success";

    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String photoUrl = "something";

      _user = model.User(
        uid: cred.user!.uid,
        username: username,
        email: email,
        password: password,
        photoUrl: photoUrl,
        createdAt: DateTime.now().toString(),
        followers: [],
        following: [],
      );

      await _firestore.collection("users").doc(_user!.uid).set(_user!.toJson());
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<model.User?> getUserDetails() async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      DocumentSnapshot? documentSnapshot =
          await _firestore.collection('users').doc(currentUser.uid).get();

      _user = model.User.fromSnap(documentSnapshot);

      return _user;
    }

    return null;
  }

  FutureOr<void> sendEmailVerification() async {
    await _auth.currentUser!.sendEmailVerification();
  }

  Future<String> logIn({
    required email,
    required password,
  }) async {
    String res = "success";
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception catch (e) {
      res = e.toString();
    }
    return res;
  }

  bool emailIsVerified() {
    User user = _auth.currentUser!;
    return user.emailVerified;
  }
}
