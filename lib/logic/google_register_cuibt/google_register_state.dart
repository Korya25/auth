class RegisterGoogleState {}

class RegisterGoogleIntial extends RegisterGoogleState {}

class RegisterGoogleLoading extends RegisterGoogleState {}

class RegisterGoogleSuccess extends RegisterGoogleState {}

class RegisterGoogleFailure extends RegisterGoogleState {
  final String errorMessage;
  RegisterGoogleFailure({required this.errorMessage});
}
