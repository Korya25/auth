import 'package:authapp/services/auth/auth_services.dart';

class AuthController {
  // Sign-up method to handle user registration.
  Future<void> register({
    required String userName,
    required String email,
    required String password,
    required dynamic formKey,
    required dynamic context,
  }) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      await AuthServices().registerWithEmail(
          userName: userName,
          email: email,
          password: password,
          context: context);
    }
  }
}
