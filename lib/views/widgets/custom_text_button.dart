import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.titleStyle});
  final Function() onTap;
  final String title;
  final TextStyle titleStyle;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: titleStyle,
      ),
    );
  }
}
