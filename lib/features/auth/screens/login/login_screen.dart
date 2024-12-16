import 'package:authapp/features/auth/screens/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:authapp/constants/app_text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 45, 45, 49),
        centerTitle: true,
        title: Text(
          'Login',
          style: AppTextStyle.appBar,
        ),
      ),
      body: LoginForm(onTap: onTap),
    );
  }
}
