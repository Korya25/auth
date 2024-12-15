import 'package:authapp/constanta/app_text_style.dart';
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
  BuildContext context,
  String errorMessage, {
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
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black87,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: Container(
          height: 100,
          padding: EdgeInsets.all(10),
          child: Text(
            errorMessage,
            style: AppTextStyle.customDialogcontent,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // منطق الحذف
              Navigator.of(context).pop();
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(
                'ok',
                style: AppTextStyle.customDialogcontent,
              )),
            ),
          ),
        ],
      );
    },
  );
}
/*

showDialog(
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
    ),

*/
