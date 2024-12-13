import 'package:flutter/material.dart';

/// Customizable TextFormField Widget
/// This widget can handle both standard text fields and password fields.
/// - [hintText]: Placeholder text for the field.
/// - [textEditingController]: Controller to manage the field's text.
/// - [obscureText]: Whether the text should be obscured (useful for passwords).
/// - [validator]: Validation function to validate the input.
/// - [hasSuffixIcon]: Whether to show a suffix icon (e.g., for toggling obscureText).
class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.obscureText = false,
    required this.validator,
    this.hasSuffixIcon = false,
    this.keyboardType,
    required this.onSaved,
    this.maxLength,
    this.maxLines = 1, // Default to 1 line if not specified
    this.style, // Allows customizing the text style
    this.onChanged,
    required this.labelText,
    required this.hintStyle,
    required this.labelStyle,
  });

  final String hintText;
  final String labelText;
  final TextStyle hintStyle;
  final TextStyle labelStyle;
  final bool obscureText;
  final bool hasSuffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final int? maxLength;
  final int maxLines;
  final TextStyle? style;
  final void Function(String)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscureText;

  @override
  void initState() {
    super.initState();
    isObscureText = widget.obscureText;
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
          obscureText: widget.hasSuffixIcon ? isObscureText : false,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          style: widget.style,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintStyle: widget.hintStyle,
            labelStyle: widget.labelStyle,
            hintText: widget.hintText,
            suffixIcon: widget.hasSuffixIcon
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    icon: Icon(
                      isObscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
