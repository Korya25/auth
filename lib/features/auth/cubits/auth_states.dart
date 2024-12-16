abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure({required this.errorMessage});
}

class AuthEmailNotVerified extends AuthState {}

class AuthPasswordResetSuccess extends AuthState {}

class AuthLoggedOut extends AuthState {}
