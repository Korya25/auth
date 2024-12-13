import 'package:authapp/views/screen/auth/login/login_screen.dart';
import 'package:authapp/views/screen/auth/register/register_screen.dart';
import 'package:flutter/material.dart';

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
