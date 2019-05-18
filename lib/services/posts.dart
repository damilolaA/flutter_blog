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

    // final Map<String, dynamic> result = json.decode(response.body);
    final results = json.decode(response.body);
    print('results, $results');
    List<Posts> posts = results.map((post) => Posts.fromMap(post)).toList();
    print('posts, $posts');
    // Posts post = Posts.fromMap(result);
    return posts;
  }
}