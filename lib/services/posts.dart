import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class PostsService {
  final String baseUrl;

  PostsService({@required this.baseUrl});

  Future<Map<String, dynamic>> fetchPosts() async{

    final http.Response response = await http.get(
      '$baseUrl/v2/posts'
    );

    final Map<String, dynamic> result = json.decode(response.body);
    return result;
  }

}