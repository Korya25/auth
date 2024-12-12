import 'package:authapp/helper/snakbar.dart';
import 'package:authapp/services/auth/auth_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AuthServices {
  // Instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Register With Email
  Future<UserCredential?> registerWithEmail({
    required String userName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      final errorMessage = handleFirebaseAuthError(e.code);
      if (context.mounted) {
        customSnackBar(context, errorMessage);
      }
      return null;
    } catch (e) {
      if (context.mounted) {
        customSnackBar(
            context, 'An unexpected error occurred. Please try again.');
      }
      return null;
    }
  }

  // Login With Email
  Future<UserCredential?> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      final String errorMessage = handleFirebaseAuthError(e.code);
      if (context.mounted) {
        customSnackBar(context, errorMessage);
      }
      return null;
    } catch (e) {
      if (context.mounted) {
        customSnackBar(
            context, 'An unexpected error occurred. Please try again.');
      }
      return null;
    }
  }

  // Login With Google

  // Forget password

  // Sign Out
}
