import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/post.dart';
import '../models/comment.dart';

Future<List<Post>> fetchPosts() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((post) => Post.fromJson(post)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}

Future<List<Comment>> fetchComments(int postId) async {
  final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId/comments'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((comment) => Comment.fromJson(comment)).toList();
  } else {
    throw Exception('Failed to load comments');
  }
}

Future<User> fetchUser(int userId) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'));

  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}
