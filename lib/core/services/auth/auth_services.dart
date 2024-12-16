import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authapp/core/services/auth/auth_error_handler.dart';
import 'package:authapp/core/utils/snakbar.dart';

class AuthServices {
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
      if (context.mounted) {
        CustomDialogHandler.showCustomDialog(
            context, 'Cheack the email to virfiy your account');
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      final errorMessage = handleRegisterError(e.code);
      if (context.mounted) {
        CustomDialogHandler.showCustomDialog(context, errorMessage);
      }
      return null;
    } catch (e) {
      if (context.mounted) {
        CustomDialogHandler.showCustomDialog(
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
      final String errorMessage = handleLoginError(e.code);
      if (context.mounted) {
        CustomDialogHandler.showCustomDialog(context, errorMessage);
      }
      return null;
    } catch (e) {
      if (context.mounted) {
        CustomDialogHandler.showCustomDialog(
            context, 'An unexpected error occurred. Please try again.');
      }
      return null;
    }
  }

  Future<void> resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      // التحقق من إدخال البريد الإلكتروني
      if (email.isEmpty) {
        CustomDialogHandler.showCustomDialog(
            context, 'Please enter your email address.');
        return;
      }

      // إرسال رابط إعادة تعيين كلمة المرور
      await _auth.sendPasswordResetEmail(email: email);

      // عرض رسالة تأكيد عند النجاح
      if (context.mounted) {
        CustomDialogHandler.showCustomDialog(
            context, 'Password reset email has been sent!');
      }
    } on FirebaseAuthException catch (e) {
      // التعامل مع أخطاء FirebaseAuthException
      final message = handleLoginError(e.code);
      if (context.mounted) {
        CustomDialogHandler.showCustomDialog(context, message);
      }
    } catch (e) {
      // التعامل مع الأخطاء العامة
      if (context.mounted) {
        CustomDialogHandler.showCustomDialog(
          context,
          'An unexpected error occurred. Please try again later.',
        );
      }
    }
  }
}
