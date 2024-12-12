import 'package:authapp/helper/snakbar.dart';
import 'package:authapp/services/auth/auth_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

// Register with Google
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId:
        '1070571847901-mmofmsebvots2ms2tlvm9te2vtausna1.apps.googleusercontent.com',
  );

  Future<User?> signInWithGoogle(dynamic context) async {
    try {
      // Attempt silent sign-in
      GoogleSignInAccount? googleUser = await _googleSignIn.signInSilently();

      if (googleUser == null) {
        // If the user is not already signed in, show a popup for sign-in
        googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          return null; // If the user cancels the sign-in
        }
      }

      // Retrieve authentication details from Google
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Use the authentication details with Firebase
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase using the credentials
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      if (context.mounted) {
        customSnackBar(
            context, 'An unexpected error occurred. Please try again.');
      }
      return null;
    }
  }

// Reset password
  Future<void> resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      // Ensure the email address is valid
      if (email.isEmpty) {
        customSnackBar(context, 'Please enter your email address');
        return;
      }

      // Send password reset email
      await _auth.sendPasswordResetEmail(email: email);

      // Show success message
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

  // Sign Out

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
