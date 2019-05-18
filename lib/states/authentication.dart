import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  AuthenticationState();
}

// class AuthenticationUninitialized extends AuthenticationState {
//   @override
//   String toString() => "AunthenticationUninitialized";
// }

class AuthenticationInitialized extends AuthenticationState {
  @override
  String toString() => "AunthenticationInitialized";
}