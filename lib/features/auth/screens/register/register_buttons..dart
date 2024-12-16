import 'package:authapp/features/auth/cubits/auth_cubits.dart';
import 'package:authapp/features/auth/widgets/action_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterButtons extends StatelessWidget {
  final bool isValid;
  final bool isLoading;
  final double spacing;
  final String email;
  final String password;
  final String userName;

  const RegisterButtons({
    super.key,
    required this.isValid,
    required this.isLoading,
    this.spacing = 0,
    required this.email,
    required this.password,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<AuthCubit>();

    return Column(
      spacing: spacing,
      children: [
        CustomActionAuthButton(
          onTap: isValid && !isLoading
              ? () {
                  authCubit.registerWithEmail(
                    email: email,
                    password: password,
                    userName: userName,
                  );
                }
              : null,
          title: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          backgroundColor: isValid ? Colors.blue : Colors.grey,
          isEnabled: isValid && !isLoading,
        ),
      ],
    );
  }
}


/*
class RegisterButtons extends StatelessWidget {
  final bool isValid;
  final double spacing;
  final String email;
  final String password;
  final String userName;
  const RegisterButtons({
    super.key,
    required this.isValid,
    this.spacing = 0,
    required this.email,
    required this.password,
    required this.userName, required bool isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<AuthCubit>();
    final isLoading = authCubit is AuthLoading;

    return Column(
      spacing: spacing,
      children: [
        CustomActionAuthButton(
          onTap: isValid && !isLoading
              ? () {
                  authCubit.registerWithEmail(
                      userName: userName,
                      email: email,
                      password: password,
                      context: context);
                }
              : () {},
          title: isLoading
              ? CircularProgressIndicator()
              : Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          backgroundColor: isValid ? Colors.blue : Colors.grey,
          isEnabled: isValid && !isLoading,
        ),
        const CustomDevider(title: 'or'),
        CustomLoginWithGoogle(
          onTap: () {
            authCubit.registerWithGoogle(context);
          },
          title: 'Sign Up with Google',
          backgroundColor: const Color.fromARGB(255, 45, 43, 43),
          loading: authCubit.state is AuthLoading ? true : false,
        ),
      ],
    );
  }
}
*/