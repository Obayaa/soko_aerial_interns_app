import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final User user;

  const LoggedIn(this.user);

  @override
  List<Object> get props => [user];
}

class LoggedOut extends AuthenticationEvent {}

class GoogleSignInRequested extends AuthenticationEvent {}
