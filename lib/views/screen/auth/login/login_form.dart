import 'package:authapp/logic/login_cuibt/login_cuibt.dart';
import 'package:authapp/logic/login_cuibt/login_state.dart';
import 'package:authapp/views/screen/auth/forget_password/forget_password_screen.dart';
import 'package:authapp/views/screen/auth/login/login_buttons..dart';
import 'package:authapp/views/screen/auth/login/login_footer.dart';
import 'package:authapp/views/screen/auth/viriactionscreen.dart';
import 'package:authapp/views/screen/home/home_screen.dart';
import 'package:authapp/views/widgets/custom_divider.dart';
import 'package:authapp/views/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        if (state is LoginSuccess) {
          // إذا تم تسجيل الدخول بنجاح
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          )); // مثال
        } else if (state is LoginEmailNotVerified) {
          // إذا لم يتم تأكيد البريد الإلكتروني
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return VirfiyScreen();
            },
          )); // شاشة التحقق
        } else if (state is LoginFailure) {
          // عرض رسالة الخطأ
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                spacing: 15,
                children: [
                  LoginFields(
                    spacing: spacing,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    validateForm: validateForm,
                  ),
                  CustomTextButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgetPasswordScreen(),
                        ),
                      );
                    },
                    title: '',
                    titletwo: 'Forget Password?',
                    titletwoStyle: const TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    titleStyle: TextStyle(),
                  ),
                  LoginButtons(
                    spacing: spacing,
                    isValid: isValid,
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                  const CustomDevider(title: 'or'),
                  LoginFooter(onTap: widget.onTap),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
