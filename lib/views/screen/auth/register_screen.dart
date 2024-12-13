import 'package:flutter/material.dart';
import 'package:authapp/constanta/app_text_style.dart';
import 'package:authapp/helper/utils/auth_validator.dart';
import 'package:authapp/services/auth/auth_controller.dart';
import 'package:authapp/views/widgets/action_auth_button.dart';
import 'package:authapp/views/widgets/custom_divider.dart';
import 'package:authapp/views/widgets/custom_google_button.dart';
import 'package:authapp/views/widgets/custom_text_button.dart';
import 'package:authapp/views/widgets/custom_text_form_field.dart';
import 'package:authapp/views/widgets/terms_and_privicy.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.onTap});

  final Function() onTap;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isAccepted = false;
  bool isValid = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final AuthController _authController = AuthController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateForm() {
    if (formKey.currentState!.validate() && isAccepted) {
      setState(() {
        isValid = true;
      });
    } else {
      setState(() {
        isValid = false;
      });
    }
  }

  void continueRegisterGoogle() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 45, 45, 49),
        centerTitle: true,
        title: Text(
          'Sign up',
          style: AppTextStyle.appBar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              spacing: 13,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  labelText: 'Email',
                  hintText: 'example@gmail.com',
                  textColor: Colors.white,
                  textEditingController: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintStyle: AppTextStyle.hintTextFormField,
                  labelStyle: AppTextStyle.labelTextFormField,
                  validator: AuthValidators.validateEmail,
                  onSaved: (value) {
                    _emailController.text = value ?? '';
                  },
                  onChanged: (_) => validateForm(),
                ),
                CustomTextFormField(
                  labelText: 'Password',
                  hintText: 'minimum 6 characters',
                  obscureText: true,
                  textColor: Colors.white,
                  textEditingController: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  hintStyle: AppTextStyle.hintTextFormField,
                  labelStyle: AppTextStyle.labelTextFormField,
                  validator: AuthValidators.validatePasswordRegister,
                  onSaved: (value) {
                    _passwordController.text = value ?? '';
                  },
                  onChanged: (_) => validateForm(),
                ),
                CustomTextFormField(
                  labelText: 'Username',
                  hintText: 'username',
                  textColor: Colors.white,
                  textEditingController: _usernameController,
                  keyboardType: TextInputType.name,
                  hintStyle: AppTextStyle.hintTextFormField,
                  labelStyle: AppTextStyle.labelTextFormField,
                  validator: AuthValidators.validateUsername,
                  onSaved: (value) {
                    _usernameController.text = value ?? '';
                  },
                  onChanged: (_) => validateForm(),
                ),
                TermsAndPrivacy(
                  isAccepted: isAccepted,
                  onPressed: () {
                    setState(() {
                      isAccepted = !isAccepted;
                      validateForm();
                    });
                  },
                ),
                CustomActionAuthButton(
                  onTap: isValid
                      ? () {
                          _authController.register(
                            userName: _usernameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            formKey: formKey,
                            context: context,
                          );
                        }
                      : () {},
                  title: 'Continue',
                  backgroundColor: isValid ? Colors.blue : Colors.grey,
                  isEnabled: isValid,
                ),
                CustomDevider(title: 'or'),
                CustomLoginWithGoogle(
                  onTap: continueRegisterGoogle,
                  title: 'Sign Up with Google',
                  backgroundColor: const Color.fromARGB(255, 45, 43, 43),
                ),
                CustomDevider(title: 'or'),
                CustomTextButton(
                  onTap: widget.onTap,
                  title: 'Aready have an account?',
                  titleStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  titletwo: 'Login now',
                  titletwoStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
