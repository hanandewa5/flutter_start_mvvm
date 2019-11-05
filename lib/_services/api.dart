import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_start_mvvm/_constants/app_config.dart';
import 'package:flutter_start_mvvm/models/user.dart';
import 'package:flutter_start_mvvm/models/comment.dart';
import 'package:flutter_start_mvvm/models/post.dart';

class Api {
  var client = new http.Client();
  static const endpoint = AppConfig.apiUrl;
  static const header = AppConfig.header;

  Future<User> getUserProfile(String email, String password) async {
    Map data = {"email": email, "password": password};
    var body = json.encode(data);
    try {
      var response = await client.post('$endpoint/auth/login',
          headers: header, body: body);
      var userData =
          (json.decode(response.body) as Map<String, dynamic>)['data'];
      return User.fromJson(userData);
    } catch (e) {
      return null;
    }
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    var response = await client.get('$endpoint/posts?userId=$userId');

    var parsed = json.decode(response.body) as List<dynamic>;

    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();

    var response = await client.get('$endpoint/comments?postId=$postId');

    var parsed = json.decode(response.body) as List<dynamic>;

    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }
}
