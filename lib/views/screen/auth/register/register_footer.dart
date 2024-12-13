import 'package:authapp/views/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onTap: onTap,
      title: 'Aready have an account?',
      titleStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      titletwo: 'Login now',
      titletwoStyle: TextStyle(
        color: Colors.blue,
        fontSize: 15,
      ),
    );
  }
}
