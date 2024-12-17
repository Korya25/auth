import 'package:flutter/material.dart';

class CustomActionAuthButton extends StatefulWidget {
  const CustomActionAuthButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.backgroundColor,
    required this.isEnabled,
  });

  final Function()? onTap;
  final Widget title;
  final Color backgroundColor;
  final bool isEnabled;

  @override
  State<CustomActionAuthButton> createState() => _CustomActionAuthButtonState();
}

class _CustomActionAuthButtonState extends State<CustomActionAuthButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isEnabled ? widget.onTap : null,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.isEnabled ? widget.backgroundColor : Colors.grey,
        ),
        child: Center(
          child: widget.title,
        ),
      ),
    );
  }
}
