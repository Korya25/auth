import 'package:authapp/constanta/app_text_style.dart';
import 'package:authapp/helper/utils/auth_validator.dart';
import 'package:authapp/logic/forget_Password_cuibt/forget_password_cuibt.dart';
import 'package:authapp/logic/forget_Password_cuibt/forget_password_state.dart';
import 'package:authapp/views/widgets/action_auth_button.dart';
import 'package:authapp/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassForm extends StatefulWidget {
  const ForgetPassForm({super.key});

  @override
  State<ForgetPassForm> createState() => _ForgetPassFormState();
}

class _ForgetPassFormState extends State<ForgetPassForm> {
  bool isValid = false;

  // Controller
  final TextEditingController _emailController = TextEditingController();

  /// Form Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateForm() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isValid = true;
      });
    } else {
      setState(() {
        isValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCuibt, ForgetPasswordState>(
      builder: (context, state) {
        final isloading = state is ForgetPasswordLoading;
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
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
                  onChanged: (_) => validateForm(),
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
                  onTap: isValid && !isloading
                      ? () {
                          BlocProvider.of<ForgetPasswordCuibt>(context)
                              .resetPassword(
                                  email: _emailController.text,
                                  context: context);
                        }
                      : () {},
                  title: isloading
                      ? CircularProgressIndicator()
                      : Text(
                          'Send Password Recoveery',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                  backgroundColor: isValid ? Colors.blue : Colors.grey,
                  isEnabled: isValid && !isloading,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
/*

*/
/*
CustomActionAuthButton(
              onTap: isValid && !isLoading
                  ? () {
                      BlocProvider.of<LoginCubit>(context).loginWithEmail(
                          email: email, password: password, context: context);
                    }
                  : () {},
              title: isLoading
                  ? CircularProgressIndicator()
                  : Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
              backgroundColor: isValid ? Colors.blue : Colors.grey,
              isEnabled: isValid && !isLoading,
            ),
*/
