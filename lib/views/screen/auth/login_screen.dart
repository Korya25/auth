import 'package:authapp/constanta/app_text_style.dart';
import 'package:authapp/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 45, 49),
        centerTitle: true,
        title: Text(
          'Login',
          style: AppTextStyle.appBar,
        ),
      ),
      body: Column(
        children: [
          CustomTextFormField(),
          CustomTextFormField(),
        ],
      ),
    );
  }
}
