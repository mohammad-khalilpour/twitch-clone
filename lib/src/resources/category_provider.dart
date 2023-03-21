import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitch_clone/src/models/category.dart';
import 'package:twitch_clone/src/resources/auth.dart';

class CategoryProvider {
  final _categories = FirebaseFirestore.instance.collection('categories');

  Stream<Iterable<Category?>> allCategories() {
    final allCategories = _categories
        .snapshots()
        .map((event) => event.docs.map((doc) => Category.fromSnapshot(doc)));

    return allCategories;
  }

  Stream<Iterable<Category?>> followingCategories() {
    List<String> following = AuthMethods().user.followingCategories;
    final followingCategories = _categories
        .where('uid', whereIn: following.isEmpty ? ['empty'] : following)
        .snapshots()
        .map((event) => event.docs.map((doc) => Category.fromSnapshot(doc)));

    return followingCategories;
  }

  static final CategoryProvider _shared = CategoryProvider._sharedInstance();
  CategoryProvider._sharedInstance();
  factory CategoryProvider() => _shared;
}
