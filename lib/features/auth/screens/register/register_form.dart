import 'package:authapp/features/auth/cubits/auth_cubits.dart';
import 'package:authapp/features/auth/cubits/auth_states.dart';
import 'package:authapp/features/auth/screens/register/register_buttons..dart';

import 'package:authapp/features/auth/widgets/terms_and_privicy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_fields.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.onTap});

  final Function() onTap;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isAccepted = false;
  bool isValid = false;
  bool isLoading = false; // حالة التحميل

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateForm() {
    if (formKey.currentState!.validate() && isAccepted) {
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
          // Register Fields
          RegisterFields(
            spacing: spacing,
            emailController: _emailController,
            passwordController: _passwordController,
            usernameController: _usernameController,
            validateForm: validateForm,
          ),

          // Terms and Privacy acceptance
          TermsAndPrivacy(
            isAccepted: isAccepted,
            onPressed: () {
              setState(() {
                isAccepted = !isAccepted;
                validateForm(); // Call validateForm() to validate when the user interacts
              });
            },
          ),
          // Register Buttons with AuthCubit logic
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              isLoading = state is AuthLoading;
              return RegisterButtons(
                spacing: spacing,
                isValid: isValid,
                isLoading: isLoading,
                email: _emailController.text,
                password: _passwordController.text,
                userName: _usernameController.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
