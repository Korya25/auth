import 'package:authapp/features/auth/screens/forget_password/forget_password_screen.dart';
import 'package:authapp/features/auth/screens/login/login_buttons..dart';

import 'package:authapp/features/auth/widgets/custom_text_button.dart';

import 'package:flutter/material.dart';
import 'Login_fields.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.onTap});

  final Function() onTap;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isValid = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateForm() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isValid = true;
      });
    } else {
      setState(() {
        isValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double spacing = 13;

    return Form(
      key: formKey,
      child: Column(
        spacing: spacing,
        children: [
          // Login fields (email and password)
          LoginFields(
            spacing: spacing,
            emailController: _emailController,
            passwordController: _passwordController,
            validateForm: validateForm,
            context: context,
          ),

          // Forget password button
          CustomTextButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgetPasswordScreen(),
                ),
              );
            },
            title: '',
            titletwo: 'Forget Password?',
            titletwoStyle: const TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            titleStyle: TextStyle(),
          ),

          // Login button
          LoginButtons(
            spacing: spacing,
            isValid: isValid,
            email: _emailController.text,
            password: _passwordController.text,
          ),
        ],
      ),
    );
  }
}


/*
class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.onTap});

  final Function() onTap;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isValid = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateForm() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isValid = true;
      });
    } else {
      setState(() {
        isValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double spacing = 15;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            spacing: 15,
            children: [
              LoginFields(
                spacing: spacing,
                emailController: _emailController,
                passwordController: _passwordController,
                validateForm: validateForm,
              ),
              CustomTextButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgetPasswordScreen(),
                    ),
                  );
                },
                title: '',
                titletwo: 'Forget Password?',
                titletwoStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                titleStyle: TextStyle(),
              ),
              LoginButtons(
                spacing: spacing,
                isValid: isValid,
                email: _emailController.text,
                password: _passwordController.text,
              ),
              const CustomDevider(title: 'or'),
              LoginFooter(
                onTap: widget.onTap,
                title: 'New to app?',
                titletwo: 'Register Now',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/