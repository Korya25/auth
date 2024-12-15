import 'package:authapp/services/auth/auth_error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authapp/helper/snakbar.dart';

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
      customSnackBar(context, 'Password reset email has been sent!');
    }
  } on FirebaseAuthException catch (e) {
    // التعامل مع أخطاء FirebaseAuthException
    final message = handleLoginError(e.code);
    if (context.mounted) {
      customSnackBar(context, message);
    }
  } catch (e) {
    // التعامل مع الأخطاء العامة
    if (context.mounted) {
      customSnackBar(
        context,
        'An unexpected error occurred. Please try again later.',
      );
    }
  }
}
