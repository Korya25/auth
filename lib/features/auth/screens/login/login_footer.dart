import 'package:authapp/features/auth/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onTap: onTap,
      title: 'New to app?',
      titleStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      titletwo: 'Register Now',
      titletwoStyle: TextStyle(
        color: Colors.blue,
        fontSize: 15,
      ),
    );
  }
}
