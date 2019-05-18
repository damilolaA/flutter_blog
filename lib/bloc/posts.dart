import 'package:bloc/bloc.dart';

import '../events/index.dart';
import '../states/index.dart';
import '../models/index.dart';
import '../services/index.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {

  @override 
  PostsState get initialState => EmptyPost();

  @override 
  Stream<PostsState> mapEventToState(PostsEvent event) async* {
    if(event is FetchPost) {
      try{
        PostsService postsService = PostsService(baseUrl: event.config.baseApiUrl);
        final Posts posts = await postsService.fetchPosts();
        yield PostsLoaded(posts: posts);
      }catch(error) {
        print('error, $error');
      }
    }
  }
} 