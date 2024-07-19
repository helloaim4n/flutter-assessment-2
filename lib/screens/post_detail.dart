import 'package:flutter/material.dart';
import '../models/post.dart';
import '../models/comment.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import '../widgets/comment_card.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Index #${post.id.toString()}'),
      ),
      body: FutureBuilder<User>(
        future: fetchUser(post.userId),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.done) {
            if (userSnapshot.hasError) {
              return const Center(
                  child: Text("Error fetching user information"));
            }
            return Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title: ${post.title}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(post.body),
                        const SizedBox(height: 10),
                        const Text('Posted by:',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                        Text(userSnapshot.data!.username),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.comment),
                      SizedBox(width: 8),
                      Text(
                        ' Comments',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<Comment>>(
                    future: fetchComments(post.id),
                    builder: (context, commentSnapshot) {
                      if (commentSnapshot.connectionState ==
                          ConnectionState.done) {
                        if (commentSnapshot.hasError) {
                          return const Center(
                              child: Text("Error fetching comments"));
                        }
                        return ListView.builder(
                          itemCount: commentSnapshot.data!.length,
                          itemBuilder: (context, index) {
                            final comment = commentSnapshot.data![index];
                            return CommentCard(comment: comment);
                          },
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
