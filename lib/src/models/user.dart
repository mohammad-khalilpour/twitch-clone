import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final String photoUrl;
  final String password;
  final String createdAt;
  final List<String> followers;
  final List<String> followingCategories;

  User({
    required this.uid,
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.password,
    required this.createdAt,
    required this.followers,
    required this.followingCategories,
  });

  static User? fromSnap(DocumentSnapshot? snap) {
    if (snap == null || snap.data() == null) return null;

    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      password: snapshot["password"],
      createdAt: snapshot["createdAt"],
      followers: List<String>.from(snapshot["followers"]) ,
      followingCategories: List<String>.from(snapshot["following"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "email": email,
        "photoUrl": photoUrl,
        "password": password,
        "createdAt": createdAt,
        "followers": followers,
        "following": followingCategories,
      };

  @override
  String toString() {
    return email;
  }
}
