import 'package:blog_app/app_config.dart';
import 'package:blog_app/bloc/posts.dart';
import 'package:blog_app/styles/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../events/index.dart';
import '../../../states/index.dart';
class Latest extends StatefulWidget{
  final AppConfig config;

  Latest({@required this.config});

  LatestState createState() => LatestState();
}

class LatestState extends State<Latest> {

  PostsBloc _postsBloc;

  @override 
  void initState() {
    super.initState();
    _postsBloc = PostsBloc();
    _postsBloc.dispatch(FetchPost(config: widget.config));
  }

  @override 
  void dispose() {
    _postsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _postsBloc,
      builder: (_, PostsState state) {
        if(state is PostsLoading) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: black,
            ),
          );
        }
        if(state is PostsLoaded) {
          final posts = state.posts;
          print('posts, $posts');
          return Container(
            child: Center(
              child: Icon(Icons.accessibility, size: 50.0, color: Colors.brown,),
            ),
          );
        }
      },
    );
  }
}