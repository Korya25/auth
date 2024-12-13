import 'package:authapp/features/auth/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onTap: onTap,
      title: 'Already have an account?',
      titleStyle: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      titletwo: 'Login Now',
      titletwoStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 15,
      ),
    );
  }
}
