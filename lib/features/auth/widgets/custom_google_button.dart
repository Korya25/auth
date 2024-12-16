import 'package:flutter/material.dart';

class CustomLoginWithGoogle extends StatelessWidget {
  const CustomLoginWithGoogle(
      {super.key,
      required this.onTap,
      required this.title,
      required this.backgroundColor,
      required this.loading});
  final Function() onTap;
  final String title;
  final Color backgroundColor;
  final bool loading;
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
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Row(
                children: [
                  Image(
                    image: AssetImage('assets/th.png'),
                    width: 30,
                    height: 30,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
      ),
    );
  }
}
