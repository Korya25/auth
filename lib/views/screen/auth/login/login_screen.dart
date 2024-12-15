import 'package:authapp/logic/google_register_cuibt/google_registur_cuibt.dart';
import 'package:authapp/logic/login_cuibt/login_cuibt.dart';
import 'package:authapp/views/screen/auth/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:authapp/constanta/app_text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 45, 45, 49),
        centerTitle: true,
        title: Text(
          'Login',
          style: AppTextStyle.appBar,
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(),
          ),
          BlocProvider<RegisterGoogleCubit>(
            create: (context) => RegisterGoogleCubit(),
          )
        ],
        child: LoginForm(onTap: onTap),
      ),
    );
  }
}
