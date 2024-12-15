import 'package:authapp/logic/google_register_cuibt/google_register_state.dart';
import 'package:authapp/logic/google_register_cuibt/google_registur_cuibt.dart';
import 'package:authapp/logic/login_cuibt/login_cuibt.dart';
import 'package:authapp/logic/login_cuibt/login_state.dart';

import 'package:authapp/views/widgets/action_auth_button.dart';
import 'package:authapp/views/widgets/custom_divider.dart';
import 'package:authapp/views/widgets/custom_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authapp/logic/register_cuibt/register_state.dart';

class LoginButtons extends StatelessWidget {
  final bool isValid;
  final double spacing;
  final String email;
  final String password;
  const LoginButtons({
    super.key,
    required this.isValid,
    this.spacing = 0,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    final registerGoogleCubit = context.watch<RegisterGoogleCubit>();

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final isLoading = state is RegisterLoading;

        return Column(
          spacing: spacing,
          children: [
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
            const CustomDevider(title: 'or'),
            CustomLoginWithGoogle(
              onTap: () {
                registerGoogleCubit.registerWithGoogle(context);
              },
              title: 'Login with Google',
              backgroundColor: const Color.fromARGB(255, 45, 43, 43),
              loading: registerGoogleCubit.state is RegisterGoogleLoading
                  ? true
                  : false,
            ),
          ],
        );
      },
    );
  }
}
