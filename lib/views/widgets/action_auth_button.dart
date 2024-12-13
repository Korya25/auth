import 'package:flutter/material.dart';

class CustomActionAuthButton extends StatefulWidget {
  const CustomActionAuthButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.backgroundColor,
    this.isDisabled = false, // متغير جديد للتحكم في حالة التفعيل
  });

  final Function() onTap;
  final String title;
  final Color backgroundColor;
  final bool isDisabled; // حالة تفعيل الزر

  @override
  State<CustomActionAuthButton> createState() => _CustomActionAuthButtonState();
}

class _CustomActionAuthButtonState extends State<CustomActionAuthButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isDisabled
          ? null
          : widget.onTap, // تعطيل النقر إذا كان الزر معطل
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.isDisabled
              ? Colors.blue
              : widget.backgroundColor, // تغيير اللون إذا كان الزر معطل
        ),
        child: Center(
          child: Text(
            widget.title,
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
