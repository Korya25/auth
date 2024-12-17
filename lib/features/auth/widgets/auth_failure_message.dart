import 'package:authapp/features/auth/cubits/auth_cubits.dart';
import 'package:authapp/features/auth/cubits/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassResetSuccessMessage extends StatelessWidget {
  const PassResetSuccessMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthPasswordResetSuccess) {
          return Text(
            'Message sent sucssuflu!',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.green, fontSize: 15),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
