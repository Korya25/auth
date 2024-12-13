import 'package:authapp/constanta/app_text_style.dart';
import 'package:authapp/helper/utils/auth_validator.dart';
import 'package:authapp/views/screen/auth/forget_password/forget_password_screen.dart';
import 'package:authapp/views/widgets/action_auth_button.dart';
import 'package:authapp/views/widgets/custom_divider.dart';
import 'package:authapp/views/widgets/custom_google_button.dart';
import 'package:authapp/views/widgets/custom_text_button.dart';
import 'package:authapp/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required, required this.onTap});
  final Function() onTap;

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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 13,
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
                obscureText: true,
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
              CustomTextButton(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ForgetPasswordScreen();
                    },
                  ));
                },
                title: '',
                titleStyle: TextStyle(),
                titletwo: 'Forget Password?',
                titletwoStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),

              // Login Button
              CustomActionAuthButton(
                onTap: () {},
                title: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                backgroundColor: Colors.grey,
                isEnabled: true,
              ),

              // Or Devider
              CustomDevider(title: 'or'),

              // Login with Google Button
              CustomLoginWithGoogle(
                onTap: () {},
                title: 'Sign in with Google',
                backgroundColor: const Color.fromARGB(255, 45, 43, 43),
                loading: false,
              ),

              // Or Devider
              CustomDevider(title: 'or'),

              // Go To register
              CustomTextButton(
                onTap: widget.onTap,
                title: 'New to app?',
                titleStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                titletwo: 'Register now',
                titletwoStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
