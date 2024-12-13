import 'package:flutter/material.dart';

class CustomLoginWithGoogle extends StatelessWidget {
  const CustomLoginWithGoogle(
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Row(
          spacing: MediaQuery.of(context).size.width / 5,
          children: [
            Image(
              image: AssetImage('assets/th.png'),
              width: 30,
              height: 30,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
