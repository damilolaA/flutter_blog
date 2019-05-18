import 'package:meta/meta.dart';
import 'package:blog_app/app_config.dart';
import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable {
  PostsEvent([ List props = const [] ]) : super(props);
}

class FetchPost extends PostsEvent {
  final AppConfig config;

  FetchPost({@required this.config});
}