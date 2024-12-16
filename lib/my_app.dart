import 'package:authapp/core/services/auth/auth_google_services.dart';
import 'package:authapp/core/services/auth/auth_services.dart';
import 'package:authapp/features/auth/cubits/auth_cubits.dart';
import 'package:authapp/features/auth/screens/main_auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            authServices: AuthServices(),
            googleServices: AuthGoogleServices(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthGate(),
      ),
    );
  }
}
