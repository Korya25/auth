import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authapp/services/auth/auth_error_handler.dart';
import 'package:authapp/helper/snakbar.dart';

class PasswordServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      if (email.isEmpty) {
        customSnackBar(context, 'Please enter your email address');
        return;
      }

      await _auth.sendPasswordResetEmail(email: email);

      if (context.mounted) {
        customSnackBar(context, 'Password reset email sent!');
      }
    } on FirebaseAuthException catch (e) {
      final message = handleFirebaseAuthError(e.code);
      if (context.mounted) {
        customSnackBar(context, message);
      }
    } catch (e) {
      if (context.mounted) {
        customSnackBar(
            context, 'An unexpected error occurred. Please try again.');
      }
    }
  }
}
