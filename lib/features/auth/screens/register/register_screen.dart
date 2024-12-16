import 'package:authapp/features/auth/screens/register/register_form.dart';
import 'package:flutter/material.dart';
import 'package:authapp/constants/app_text_style.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 45, 45, 49),
        centerTitle: true,
        title: Text(
          'Sign up',
          style: AppTextStyle.appBar,
        ),
      ),
      body: RegisterForm(onTap: onTap),
    );
  }
}
