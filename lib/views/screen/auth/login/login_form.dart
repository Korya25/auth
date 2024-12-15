import 'package:authapp/logic/login_cuibt/login_cuibt.dart';
import 'package:authapp/logic/login_cuibt/login_state.dart';
import 'package:authapp/views/screen/auth/forget_password/forget_password_screen.dart';
import 'package:authapp/views/screen/auth/login/login_buttons..dart';
import 'package:authapp/views/screen/auth/login/login_footer.dart';
import 'package:authapp/views/widgets/custom_divider.dart';
import 'package:authapp/views/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authapp/logic/register_cuibt/register_state.dart';
import 'Login_fields.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.onTap});

  final Function() onTap;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isValid = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    double spacing = 15;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.toString())),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                spacing: spacing,
                children: [
                  LoginFields(
                    spacing: spacing,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    validateForm: validateForm,
                  ),
                  CustomTextButton(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ForgetPasswordScreen();
                        },
                      ));
                    },
                    title: '',
                    titletwo: 'Forget Password?',
                    titletwoStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    titleStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                  LoginButtons(
                    spacing: spacing,
                    isValid: isValid,
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                  CustomDevider(title: 'or'),
                  LoginFooter(
                    onTap: widget.onTap,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
