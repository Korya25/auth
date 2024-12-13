import 'package:authapp/logic/google_register_cuibt/google_registur_cuibt.dart';
import 'package:authapp/logic/register_cuibt/register_cuibt.dart';
import 'package:authapp/views/screen/auth/register/register_form.dart';
import 'package:flutter/material.dart';
import 'package:authapp/constanta/app_text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.onTap});

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
          'Sign up',
          style: AppTextStyle.appBar,
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<RegisterCubit>(
            create: (context) => RegisterCubit(),
          ),
          BlocProvider<RegisterGoogleCubit>(
            create: (context) => RegisterGoogleCubit(),
          )
        ],
        child: RegisterForm(onTap: onTap),
      ),
    );
  }
}
