import 'package:bloc/bloc.dart';

import '../events/index.dart';
import '../states/index.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  AuthenticationBloc();

  @override
  // AuthenticationState get initialState => AuthenticationUninitialized();
  AuthenticationState get initialState => AuthenticationInitialized();


  @override 
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if(event is AppStarted) {
      yield AuthenticationInitialized();
    }
  }
}