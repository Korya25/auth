import 'package:firebase_auth/firebase_auth.dart';
import 'package:authapp/core/services/auth/auth_error_handler.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Register with Email
  Future<UserCredential?> registerWithEmail({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw handleRegisterError(e.code);
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  // Login with Email
  Future<UserCredential?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw handleLoginError(e.code);
    } catch (e) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  // Reset Password
  Future<void> resetPassword({required String email}) async {
    try {
      if (email.isEmpty) {
        throw 'Please enter your email address.';
      }
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw handleLoginError(e.code);
    } catch (e) {
      throw 'An unexpected error occurred. Please try again later.';
    }
  }
}
