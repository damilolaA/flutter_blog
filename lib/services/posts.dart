import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../models/index.dart';
class PostsService {
  final String baseUrl;

  PostsService({@required this.baseUrl});

  Future<Posts> fetchPosts() async{

    final http.Response response = await http.get(
      '$baseUrl/v2/posts'
    );

    final Map<String, dynamic> result = json.decode(response.body);
    Posts post = Posts.fromMap(result);
    return post;
  }
}