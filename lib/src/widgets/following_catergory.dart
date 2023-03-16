import 'package:flutter/material.dart';


class FollowingCategory extends StatelessWidget {
  const FollowingCategory({
    super.key,
    required this.picUrl,
    required this.name,
    required this.viewers,
  });

  final String picUrl;
  final String name;
  final int viewers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          width: 150,
          child: Image.network(picUrl),
        ),
        Text(name),
        Row(
          children: [
            const Icon(Icons.circle, color: Colors.red),
            Text(viewers.toString()),
          ],
        )
      ],
    );
  }
}
