import 'package:blog_app/models/index.dart';
import 'package:equatable/equatable.dart';

class PostsStates extends Equatable {

  PostsStates([ List props = const [] ]) : super(props);
}

class EmptyPosts extends PostsStates {}

class PostsError extends PostsStates {}

