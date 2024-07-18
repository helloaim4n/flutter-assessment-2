import 'package:flutter/material.dart';
import '../models/post.dart';
import '../screens/post_detail.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.body),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDetail(post: post),
            ),
          );
        },
      ),
    );
  }
}
