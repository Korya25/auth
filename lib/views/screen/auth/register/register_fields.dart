import 'package:authapp/constanta/app_text_style.dart';
import 'package:authapp/helper/utils/auth_validator.dart';
import 'package:authapp/views/widgets/custom_text_form_field.dart';
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
          validator: AuthValidators.validatePasswordRegister,
          onSaved: (value) {
            passwordController.text = value ?? '';
          },
          onChanged: (_) => validateForm(),
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
          onSaved: (value) {
            usernameController.text = value ?? '';
          },
          onChanged: (_) => validateForm(),
        ),
      ],
    );
  }
}
