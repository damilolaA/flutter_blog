import 'package:bloc/bloc.dart';

import '../events/index.dart';
import '../states/index.dart';
import '../models/index.dart';
import '../services/index.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {

  @override 
  PostsState get initialState => PostsLoading();

  @override 
  Stream<PostsState> mapEventToState(PostsEvent event) async* {
    if(event is FetchPost) {
      yield PostsLoading();
      try{
        PostsService postsService = PostsService(baseUrl: event.config.baseApiUrl);
        final List<Posts> posts = await postsService.fetchPosts();
        yield PostsLoaded(posts: posts);
      }catch(error) {
        yield PostsError();
        print('error, $error');
      }
    }
  }
} 