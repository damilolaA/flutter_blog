import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../models/index.dart';
class PostsService {
  final String baseUrl;

  PostsService({@required this.baseUrl});

  Future<List<Posts>> fetchPosts() async{

    final http.Response response = await http.get(
      '$baseUrl/v2/posts'
    );

    List results = json.decode(response.body);
    // List<Posts> posts = results.map((post) => Posts.fromMap(post)).toList();
    List<Posts> posts = results.map((post) {
      post.remove("_links");
      return Posts.fromMap(post);
    }).toList();
    return posts;
  }
}