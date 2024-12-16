import 'package:authapp/features/auth/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
    required this.onTap,
    required this.title,
    required this.titletwo,
  });

  final Function() onTap;
  final String title;
  final String titletwo;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onTap: onTap,
      title: title,
      titleStyle: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      titletwo: titletwo,
      titletwoStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 15,
      ),
    );
  }
}


/*
class LoginFooter extends StatelessWidget {
  const LoginFooter(
      {super.key,
      required this.onTap,
      required this.title,
      required this.titletwo});
  final Function() onTap;
  final String title;
  final String titletwo;
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onTap: onTap,
      title: title,
      titleStyle: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      titletwo: titletwo,
      titletwoStyle: TextStyle(
        color: Colors.blue,
        fontSize: 15,
      ),
    );
  }
}
*/