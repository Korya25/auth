import 'package:authapp/constants/app_text_style.dart';
import 'package:authapp/core/utils/auth_validator.dart';
import 'package:authapp/core/utils/snakbar.dart';
import 'package:authapp/features/auth/cubits/auth_cubits.dart';
import 'package:authapp/features/auth/cubits/auth_states.dart';
import 'package:authapp/features/auth/widgets/action_auth_button.dart';
import 'package:authapp/features/auth/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassForm extends StatefulWidget {
  const ForgetPassForm({super.key});

  @override
  State<ForgetPassForm> createState() => _ForgetPassFormState();
}

class _ForgetPassFormState extends State<ForgetPassForm> {
  bool isValid = false;
  bool isEmailValid = false;

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

  void validateEmail() {
    final email = _emailController.text;
    setState(() {
      isEmailValid = AuthValidators.validateEmail(email) == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        // Listen for state changes and show appropriate feedback
        if (state is AuthPasswordResetSuccess) {
          // Show success message
          Navigator.pushReplacementNamed(context, '/login');
          CustomDialogHandler.showCustomDialog(context,
              'we have sent you an email with instructions to recover your password');
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final authCubit = context.watch<AuthCubit>();
          final isLoading = authCubit is AuthLoading;

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
                    onChanged: (_) {
                      validateForm();
                      validateEmail();
                    },
                  ),

                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is AuthFailureResetPass) {
                        return Text(
                          state.errorMessage,
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),

                  // Hint
                  Text(
                    'Enter your email above and if an account exists we will send you an email with a link to recover your password.',
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(162, 211, 210, 210),
                    ),
                  ),

                  // Password Recovery Button
                  CustomActionAuthButton(
                    onTap: isValid && !isLoading && isEmailValid
                        ? () {
                            authCubit.resetPassword(
                              email: _emailController.text,
                              context: context,
                            );
                          }
                        : null,
                    title: isLoading
                        ? CircularProgressIndicator()
                        : Text(
                            'Send Password Recovery',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                    backgroundColor: isValid && isEmailValid && !isLoading
                        ? Colors.blue
                        : Colors.grey,
                    isEnabled: isValid && isEmailValid && !isLoading,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
