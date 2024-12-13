import 'package:authapp/constanta/app_text_style.dart';
import 'package:flutter/material.dart';

class SettingeScreen extends StatelessWidget {
  const SettingeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 45, 45, 49),
        centerTitle: true,
        title: Text(
          'Settings',
          style: AppTextStyle.appBar,
        ),
      ),
    );
  }
}
