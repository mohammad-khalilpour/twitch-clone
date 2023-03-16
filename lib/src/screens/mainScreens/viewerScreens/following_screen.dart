import 'package:flutter/material.dart';
import 'package:twitch_clone/src/models/category.dart';
import 'package:twitch_clone/src/resources/category_provider.dart';
import 'package:twitch_clone/src/widgets/following_category_list.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  late final CategoryProvider _categoriesService;

  @override
  void initState() {
    _categoriesService = CategoryProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Following"),
            Expanded(
              child: StreamBuilder(
                stream: _categoriesService.followingCategories(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      if (snapshot.hasData) {
                        final allCategories =
                            snapshot.data as Iterable<Category>;

                        return FollowingCategoriesList(
                          categories: allCategories,
                          onDeleteNote: (category) {},
                          onTap: (category) {},
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    default:
                      return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
