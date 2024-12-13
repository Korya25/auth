import 'package:authapp/logic/google_register_cuibt/google_register_state.dart';
import 'package:authapp/services/auth/auth_google_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterGoogleCubit extends Cubit<RegisterGoogleState> {
  RegisterGoogleCubit() : super(RegisterGoogleIntial());

  Future<void> registerWithGoogle(BuildContext context) async {
    try {
      emit(RegisterGoogleLoading());
      await AuthGoogleServices().signInWithGoogle(context);
      emit(RegisterGoogleSuccess());
    } on FirebaseAuthException catch (e) {
      emit(RegisterGoogleFailure(errorMessage: e.code));
    } catch (e) {
      emit(RegisterGoogleFailure(errorMessage: e.toString()));
    }
  }
}
