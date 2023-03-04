import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final String photoUrl;
  final String password;
  final String createdAt;
  final List followers;
  final List following;
  final bool emailIsVerified;

  User({
    required this.uid,
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.password,
    required this.createdAt,
    required this.followers,
    required this.following,
    required this.emailIsVerified,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      password: snapshot["password"],
      createdAt: snapshot["createdAt"],
      followers: snapshot["followers"],
      following: snapshot["following"],
      emailIsVerified: snapshot["emailIsVerified"],
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
        "following": following,
        "emailIsVerified": emailIsVerified,
      };

  @override
  String toString() {
    return email;
  }
}
