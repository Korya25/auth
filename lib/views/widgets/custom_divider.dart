import 'package:flutter/material.dart';

class CustomDevider extends StatelessWidget {
  const CustomDevider({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 15,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Divider(),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Divider(),
        )
      ],
    );
  }
}
