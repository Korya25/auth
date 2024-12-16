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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        GestureDetector(
          onTap: onTap,
          child: InkWell(
            onTap: onTap,
            splashColor: Colors.blue, // تأثير الضغط
            highlightColor: Colors.blue, // تأثير الضغط
            child: Text(
              titletwo,
              style: titletwoStyle,
            ),
          ),
        ),
      ],
    );
  }
}

/*
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
    return Row(
      spacing: 3,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            titletwo,
            style: titletwoStyle,
          ),
        ),
      ],
    );
  }
}
*/
