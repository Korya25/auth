import 'package:authapp/constanta/app_text_style.dart';
import 'package:authapp/logic/forget_Password_cuibt/forget_password_cuibt.dart';
import 'package:authapp/views/screen/auth/forget_password/forget_pass_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 45, 49),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Forget Password',
          style: AppTextStyle.appBar,
        ),
      ),
      body: BlocProvider(
        create: (context) => ForgetPasswordCuibt(),
        child: ForgetPassForm(),
      ),
    );
  }
}
