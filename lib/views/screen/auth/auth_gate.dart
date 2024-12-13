import 'package:authapp/views/screen/auth/login_or_register_screen.dart';
import 'package:authapp/views/screen/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // حالة انتظار البيانات
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasError) {
            // حالة وجود خطأ أثناء جلب البيانات
            return const Scaffold(
              body: Center(
                child: Text(
                  "An error occurred. Please try again.",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
            );
          } else if (snapshot.hasData) {
            // حالة المستخدم مسجل الدخول
            return const HomeScreen();
          } else {
            // حالة عدم وجود بيانات (غير مسجل الدخول)
            return const LoginOrRegisterScreen();
          }
        } else {
          // حالة أخرى غير متوقعة
          return const Scaffold(
            body: Center(
              child: Text(
                "Unexpected state. Please restart the app.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          );
        }
      },
    );
  }
}
/*
import 'package:authapp/views/screen/auth/login_or_register_screen.dart';
import 'package:authapp/views/screen/home/home_screen.dart';
import 'package:authapp/views/screen/auth/verification_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // حالة انتظار البيانات
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasError) {
            // حالة وجود خطأ أثناء جلب البيانات
            return const Scaffold(
              body: Center(
                child: Text(
                  "An error occurred. Please try again.",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
            );
          } else if (snapshot.hasData) {
            // المستخدم مسجل الدخول
            final user = snapshot.data!;
            if (!user.emailVerified) {
              // إذا كان البريد الإلكتروني غير مُحقق
              return const VerificationScreen();
            } else {
              // إذا كان البريد الإلكتروني مُحقق
              return const HomeScreen();
            }
          } else {
            // المستخدم غير مسجل الدخول
            return const LoginOrRegisterScreen();
          }
        } else {
          // حالة غير متوقعة
          return const Scaffold(
            body: Center(
              child: Text(
                "Unexpected state. Please restart the app.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          );
        }
      },
    );
  }
}

*/
