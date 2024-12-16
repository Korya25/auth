import 'package:authapp/features/auth/screens/main_auth/login_or_register_screen.dart';
import 'package:authapp/features/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return _buildLoadingScreen();
          case ConnectionState.active:
            return _buildContentBasedOnSnapshot(context, snapshot);
          default:
            return _buildErrorScreen(
                "Unexpected state. Please restart the app.");
        }
      },
    );
  }

  // شاشة تحميل
  Widget _buildLoadingScreen() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  // شاشة خطأ
  Widget _buildErrorScreen(String errorMessage) {
    return Scaffold(
      body: Center(
        child: Text(
          errorMessage,
          style: const TextStyle(fontSize: 16, color: Colors.red),
        ),
      ),
    );
  }

  // بناء محتوى الشاشة بناءً على حالة Snapshot
  Widget _buildContentBasedOnSnapshot(
      BuildContext context, AsyncSnapshot<User?> snapshot) {
    if (snapshot.hasError) {
      return _buildErrorScreen("An error occurred. Please try again.");
    }
    if (snapshot.hasData) {
      return const HomeScreen();
    }
    // المستخدم غير مسجل الدخول
    return const LoginOrRegisterScreen();
  }
}
