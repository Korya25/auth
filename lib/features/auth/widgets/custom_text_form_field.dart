import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.obscureText = false,
    required this.validator,
    this.keyboardType,
    required this.onSaved,
    this.maxLength,
    this.maxLines = 1,
    this.style,
    this.onChanged,
    required this.labelText,
    required this.hintStyle,
    required this.labelStyle,
    this.textColor = Colors.black,
    this.autovalidateMode = AutovalidateMode.disabled,
  });

  final String hintText;
  final String labelText;
  final TextStyle hintStyle;
  final TextStyle labelStyle;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final int? maxLength;
  final int maxLines;
  final TextStyle? style;
  final void Function(String)? onChanged;
  final Color textColor;
  final AutovalidateMode autovalidateMode;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscureText;
  bool isValid = false;
  bool hasText = false;

  @override
  void initState() {
    super.initState();
    isObscureText = widget.obscureText;
  }

  void _validate(String value) {
    setState(() {
      hasText = value.isNotEmpty;
      if (widget.validator != null) {
        isValid = widget.validator!(value) == null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: widget.labelStyle,
        ),
        TextFormField(
          onSaved: widget.onSaved,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          controller: widget.textEditingController,
          obscureText: isObscureText,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          style: widget.style ?? TextStyle(color: widget.textColor),
          onChanged: (value) {
            _validate(value);
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          decoration: InputDecoration(
            hintStyle: widget.hintStyle,
            labelStyle: widget.labelStyle,
            hintText: widget.hintText,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromARGB(141, 158, 158, 158),
                width: 1.0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromARGB(160, 158, 158, 158),
                width: 1.0,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromARGB(152, 158, 158, 158),
                width: 1.0,
              ),
            ),
            suffixIcon: hasText
                ? Icon(
                    isValid ? Icons.check_circle : Icons.error,
                    color: isValid ? Colors.green : Colors.red,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
