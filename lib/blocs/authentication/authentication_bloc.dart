import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soko_aerial_interns_app/data/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Events
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

class GoogleSignInRequested extends AuthenticationEvent {
  final BuildContext context;

  const GoogleSignInRequested(this.context);


}

// States
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User user;

  const Authenticated(this.user);

  @override
  List<Object> get props => [user];
}

class Unauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  const AuthenticationFailure(this.message);

  @override
  List<Object> get props => [message];
}

// BLoC
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({required this.userRepository}) : super(Uninitialized()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthenticationState> emit) async {
    try {
      final User? user = userRepository.currentUser;
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (_) {
      emit(Unauthenticated());
    }
    print('AppStarted event handled');
  }

  Future<void> _onLoggedIn(LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(Authenticated(event.user));
  }

  Future<void> _onLoggedOut(LoggedOut event, Emitter<AuthenticationState> emit) async {
    await userRepository.signOut();
    emit(Unauthenticated());
  }

  Future<void> _onGoogleSignInRequested(GoogleSignInRequested event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final User? user = await userRepository.signInWithGoogle(event.context);
      if (user != null) {
        emit(Authenticated(user));
        Navigator.pushReplacementNamed(event.context, '/home', arguments: user);
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }
}
