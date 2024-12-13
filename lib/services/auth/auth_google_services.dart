import 'package:authapp/views/screen/auth/main_auth/auth_gate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:authapp/helper/snakbar.dart';

class AuthGoogleServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signInSilently();

      if (googleUser == null) {
        googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          return null;
        }
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      if (context.mounted) {
        customSnackBar(context, 'Error: ${e.toString()}');
      }
      return null;
    }
  }

  // دالة لتسجيل الخروج
  Future<void> signOut(BuildContext context) async {
    try {
      // تسجيل الخروج من Google Sign-In
      await _googleSignIn.signOut();
      // تسجيل الخروج من Firebase
      await _auth.signOut();

      // تحديث واجهة المستخدم بعد تسجيل الخروج
      if (context.mounted) {
        // يمكن استبدال هذا بالتوجيه إلى صفحة تسجيل الدخول أو أي شاشة أخرى
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return AuthGate();
          },
        ));
      }

      // عرض رسالة توضح أن تسجيل الخروج تم بنجاح
      if (context.mounted) {
        final snackBar = SnackBar(content: Text('You have been logged out.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      // التعامل مع الأخطاء إذا حدثت أثناء تسجيل الخروج
      if (context.mounted) {
        final snackBar = SnackBar(content: Text('Error: ${e.toString()}'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
