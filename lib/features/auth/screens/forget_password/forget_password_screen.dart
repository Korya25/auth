import 'package:authapp/constants/app_text_style.dart';
import 'package:authapp/features/auth/screens/forget_password/forget_password_form.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 45, 49),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Forget Password',
          style: AppTextStyle.appBar,
        ),
      ),
      body: ForgetPassForm(),
    );
  }
}
