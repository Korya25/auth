import 'package:authapp/features/auth/screens/register/register_buttons..dart';
import 'package:authapp/features/auth/screens/register/register_footer.dart';
import 'package:authapp/features/auth/widgets/custom_divider.dart';
import 'package:authapp/features/auth/widgets/terms_and_privicy.dart';
import 'package:flutter/material.dart';

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

    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            spacing: spacing,
            children: [
              RegisterFields(
                spacing: spacing,
                emailController: _emailController,
                passwordController: _passwordController,
                usernameController: _usernameController,
                validateForm: validateForm,
              ),
              TermsAndPrivacy(
                isAccepted: isAccepted,
                onPressed: () {
                  setState(() {
                    isAccepted = !isAccepted;
                    validateForm();
                  });
                },
              ),
              RegisterButtons(
                spacing: spacing,
                isValid: isValid,
                email: _emailController.text,
                password: _passwordController.text,
                userName: _usernameController.text,
              ),
              CustomDevider(title: 'or'),
              RegisterFooter(
                onTap: widget.onTap,
              )
            ],
          ),
        ),
      ),
    );
  }
}
