import 'package:authapp/views/widgets/action_auth_button.dart';
import 'package:authapp/views/widgets/custom_divider.dart';
import 'package:authapp/views/widgets/custom_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authapp/logic/register_cuibt/register_cuibt.dart';
import 'package:authapp/logic/register_cuibt/register_state.dart';

class RegisterButtons extends StatelessWidget {
  final bool isValid;
  final Function() onGoogleTap;
  final double spacing;

  const RegisterButtons({
    super.key,
    required this.isValid,
    required this.onGoogleTap,
    this.spacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final isLoading = state is RegisterLoading;

        return Column(
          spacing: spacing,
          children: [
            CustomActionAuthButton(
              onTap: isValid && !isLoading
                  ? () {
                      BlocProvider.of<RegisterCubit>(context).register(
                        userName: 'testUser',
                        email: 'test@test.com',
                        password: 'password123',
                        context: context,
                      );
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
              onTap: onGoogleTap,
              title: 'Sign Up with Google',
              backgroundColor: const Color.fromARGB(255, 45, 43, 43),
            ),
          ],
        );
      },
    );
  }
}
