import 'package:authapp/constanta/app_text_style.dart';
import 'package:authapp/helper/utils/auth_validator.dart';
import 'package:authapp/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function validateForm;
  final double spacing;

  const LoginFields({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.validateForm,
    this.spacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: spacing,
      children: [
        CustomTextFormField(
          labelText: 'Email',
          hintText: 'example@gmail.com',
          textColor: Colors.white,
          textEditingController: emailController,
          keyboardType: TextInputType.emailAddress,
          hintStyle: AppTextStyle.hintTextFormField,
          labelStyle: AppTextStyle.labelTextFormField,
          validator: AuthValidators.validateEmail,
          onSaved: (value) {
            emailController.text = value ?? '';
          },
          onChanged: (_) => validateForm(),
        ),
        CustomTextFormField(
          labelText: 'Password',
          hintText: 'minimum 6 characters',
          obscureText: true,
          textColor: Colors.white,
          textEditingController: passwordController,
          keyboardType: TextInputType.visiblePassword,
          hintStyle: AppTextStyle.hintTextFormField,
          labelStyle: AppTextStyle.labelTextFormField,
          validator: AuthValidators.validatePasswordLogin,
          onSaved: (value) {
            passwordController.text = value ?? '';
          },
          onChanged: (_) => validateForm(),
        ),
      ],
    );
  }
}
