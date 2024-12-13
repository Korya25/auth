import 'package:authapp/constanta/app_text_style.dart';
import 'package:authapp/helper/utils/auth_validator.dart';
import 'package:authapp/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Form key
  GlobalKey<FormState> formKey = GlobalKey();

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
      body: Form(
        key: formKey,
        child: Column(
          children: [
            // Email or username
            CustomTextFormField(
              labelText: 'Email or username',
              hintText: 'example@gmail.com',
              textColor: Colors.white,
              textEditingController: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintStyle: AppTextStyle.hintTextFormField,
              labelStyle: AppTextStyle.labelTextFormField,
              validator: AuthValidators.validateEmail,
              onSaved: (value) {
                _emailController.text = value ?? '';
              },
            ),

            // Password
            CustomTextFormField(
              labelText: 'Password',
              hintText: 'minimum 6 characters',
              hasSuffixIcon: true,
              textColor: Colors.white,
              textEditingController: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              hintStyle: AppTextStyle.hintTextFormField,
              labelStyle: AppTextStyle.labelTextFormField,
              validator: AuthValidators.validatePasswordLogin,
              onSaved: (value) {
                _passwordController.text = value ?? '';
              },
            ),
            // Forget Password

            // Login Button

            // Or Devider

            // Login with Google Button
          ],
        ),
      ),
    );
  }
}
