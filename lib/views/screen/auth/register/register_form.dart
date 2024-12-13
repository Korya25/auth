import 'package:authapp/views/screen/auth/register/register_buttons..dart';
import 'package:authapp/views/screen/auth/register/register_footer.dart';
import 'package:authapp/views/widgets/custom_divider.dart';
import 'package:authapp/views/widgets/terms_and_privicy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authapp/logic/register_cuibt/register_cuibt.dart';
import 'package:authapp/logic/register_cuibt/register_state.dart';
import 'register_fields.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.onTap});

  final Function() onTap;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isAccepted = false;
  bool isValid = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    double spacing = 13;

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
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
                  RegisterFields(
                    spacing: spacing,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    usernameController: _usernameController,
                    validateForm: validateForm,
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
                  RegisterButtons(
                    spacing: spacing,
                    isValid: isValid,
                  ),
                  CustomDevider(title: 'or'),
                  RegisterFooter(
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
