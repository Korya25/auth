import 'package:authapp/constanta/app_text_style.dart';
import 'package:authapp/helper/utils/auth_validator.dart';
import 'package:authapp/views/widgets/action_auth_button.dart';
import 'package:authapp/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  // Controller
  final TextEditingController _emailController = TextEditingController();

  /// Form Key
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 45, 49),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Forget Password',
          style: AppTextStyle.appBar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formkey,
          child: Column(
            spacing: 10,
            children: [
              // Email
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
              ),

              // Hint
              Text(
                'Enter your email above and if an account exists we will send you an email with a link to recover your password',
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(162, 211, 210, 210),
                ),
              ),

              // Password Recavory Button
              CustomActionAuthButton(
                onTap: () {},
                title: 'Send Password Recoveery',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
