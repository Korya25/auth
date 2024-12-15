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
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

//! Custom Dialog
class CustomDialogHandler {
  static bool _isDialogShowing = false;

  static Future<void> showCustomDialog(
    BuildContext context,
    String errorMessage, {
    TextEditingController? controller,
    void Function()? onPressed,
    bool isObscure = false,
    String? hintText,
    Widget? textWidget,
    Widget? widget,
    Color? titleColor,
  }) async {
    // تحقق مما إذا كان الحوار معروضًا بالفعل
    if (_isDialogShowing) return;

    _isDialogShowing = true;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black87,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Container(
            height: 100,
            padding: const EdgeInsets.all(10),
            child: Text(
              errorMessage,
              style: AppTextStyle.customDialogcontent,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
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
                    'OK',
                    style: AppTextStyle.customDialogcontent,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    // عند إغلاق الحوار، إعادة تعيين الحالة
    _isDialogShowing = false;
  }
}
