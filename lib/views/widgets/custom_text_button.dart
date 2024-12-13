import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.titletwo,
    required this.titletwoStyle,
    required this.titleStyle,
  });
  final Function() onTap;
  final String title;
  final String titletwo;
  final TextStyle titleStyle;
  final TextStyle titletwoStyle;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Text(
            titletwo,
            style: titletwoStyle,
          ),
        ],
      ),
    );
  }
}
