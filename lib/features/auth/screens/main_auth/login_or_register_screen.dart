import 'package:flutter/material.dart';

import 'package:authapp/features/auth/screens/login/login_screen.dart'
    as login_screen;
import 'package:authapp/features/auth/screens/register/register_screen.dart'
    as register_screen;

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  bool showLoginPage = true;

  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 30),
        child: showLoginPage
            ? login_screen.LoginScreen(
                key: const ValueKey('login'),
                onTap: togglePage,
              )
            : register_screen.RegisterScreen(
                // تأكد من أنه تم استخدام البادئة هنا
                key: const ValueKey('register'),
                onTap: togglePage,
              ),
      ),
    );
  }
}


/*
class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  bool showloginpage = true;

  void toggelePage() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return LoginScreen(
        onTap: toggelePage,
      );
    } else {
      return RegisterScreen(
        onTap: toggelePage,
      );
    }
  }
}
*/