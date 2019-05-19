import 'package:meta/meta.dart';
import 'package:blog_app/models/index.dart';
import 'package:equatable/equatable.dart';

class PostsState extends Equatable {

  PostsState([ List props = const [] ]) : super(props);
}

class EmptyPost extends PostsState {}

class PostsError extends PostsState {}

class PostsLoading extends PostsState{}
class PostsLoaded extends PostsState {
  final List<Posts> posts;

  PostsLoaded({@required this.posts}) : assert(posts != null), super([posts]);
}

