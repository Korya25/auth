import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure({required this.errorMessage});
}

class AuthLoginSuccess extends AuthState {
  final User user;
  AuthLoginSuccess({required this.user});
}

class AuthRegistrationSuccess extends AuthState {
  final User user;
  AuthRegistrationSuccess({required this.user});
}

class AuthEmailNotVerified extends AuthState {}

class AuthPasswordResetSuccess extends AuthState {}

class AuthLoggedOut extends AuthState {}


/*
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure({required this.errorMessage});
}

class AuthPasswordResetSuccess extends AuthState {}

class AuthLoggedOut extends AuthState {}
*/