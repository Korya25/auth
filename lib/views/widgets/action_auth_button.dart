import 'package:flutter/material.dart';

class CustomActionAuthButton extends StatelessWidget {
  const CustomActionAuthButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.backgroundColor});
  final Function() onTap;
  final String title;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
