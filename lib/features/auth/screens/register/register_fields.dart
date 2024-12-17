import 'package:authapp/constants/app_text_style.dart';
import 'package:authapp/core/utils/auth_validator.dart';
import 'package:authapp/features/auth/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;
  final Function validateForm;
  final double spacing;

  const RegisterFields({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.usernameController,
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
          onChanged: (_) => validateForm(),
          autovalidateMode:
              AutovalidateMode.onUserInteraction, // تفعيل التحقق التلقائي
          onSaved: (String? value) {
            emailController.text = value ?? '';
          },
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
          validator: AuthValidators.validatePasswordRegister,
          onChanged: (_) => validateForm(),
          autovalidateMode:
              AutovalidateMode.onUserInteraction, // تفعيل التحقق التلقائي
          onSaved: (String? value) {
            passwordController.text = value ?? '';
          },
        ),
        CustomTextFormField(
          labelText: 'Username',
          hintText: 'username',
          textColor: Colors.white,
          textEditingController: usernameController,
          keyboardType: TextInputType.name,
          hintStyle: AppTextStyle.hintTextFormField,
          labelStyle: AppTextStyle.labelTextFormField,
          validator: AuthValidators.validateUsername,
          onChanged: (_) => validateForm(),
          autovalidateMode:
              AutovalidateMode.onUserInteraction, // تفعيل التحقق التلقائي
          onSaved: (String? value) {
            usernameController.text = value ?? '';
          },
        ),
      ],
    );
  }
}
