import 'package:flutter/material.dart';

//! Custom SnackBar
void customSnackBar(BuildContext context, String message,
    {Color? color, int? seconds}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: seconds ?? 3),
      backgroundColor: color ?? Colors.red,
      content: Center(
        child: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

//! Custom Dialog
Future<void> customDialog(
  BuildContext context, {
  required String title,
  required String btnTitle,
  TextEditingController? controller,
  void Function()? onPressed,
  bool isobscure = false,
  String? hintText,
  Widget? textWidget,
  Widget? widget,
  Color? titleColor,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      title: textWidget ??
          Text(
            title,
            style: TextStyle(color: titleColor ?? Colors.white),
            textAlign: TextAlign.center,
          ),
      content: widget ??
          TextField(
            style: TextStyle(color: Colors.white),
            obscureText: isobscure,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText ?? "Enter value",
              filled: false,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(btnTitle),
          ),
        ),
      ],
    ),
  );
}
