import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitch_clone/src/models/category.dart';
import 'package:twitch_clone/src/widgets/following_catergory.dart';

typedef CategoryCallback = void Function(Category note);

class FollowingCategoriesList extends StatelessWidget {
  final Iterable<Category> categories;
  final CategoryCallback onDeleteNote;
  final CategoryCallback onTap;

  const FollowingCategoriesList({
    Key? key,
    required this.categories,
    required this.onDeleteNote,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemExtent: 155,
      itemBuilder: (context, index) {
        final category = categories.elementAt(index);
        return FollowingCategory(
          picUrl: category.picUrl,
          name: category.name,
          viewers: category.viewers,
        );
      },
    );
  }
}
