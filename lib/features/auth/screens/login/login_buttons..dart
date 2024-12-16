import 'package:authapp/features/auth/cubits/auth_cubits.dart';
import 'package:authapp/features/auth/cubits/auth_states.dart';
import 'package:authapp/features/auth/widgets/action_auth_button.dart';
import 'package:authapp/features/auth/widgets/custom_divider.dart';
import 'package:authapp/features/auth/widgets/custom_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final authCubit = context.watch<AuthCubit>();

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return Column(
          spacing: spacing,
          children: [
            CustomActionAuthButton(
              onTap: isValid && !isLoading
                  ? () {
                      authCubit.loginWithEmail(
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
                authCubit.registerWithGoogle(context);
              },
              title: 'Login with Google',
              backgroundColor: const Color.fromARGB(255, 45, 43, 43),
              loading: authCubit.state is AuthLoading ? true : false,
            ),
          ],
        );
      },
    );
  }
}
