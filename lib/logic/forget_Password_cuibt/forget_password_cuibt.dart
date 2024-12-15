import 'package:authapp/logic/forget_Password_cuibt/forget_password_state.dart';
import 'package:authapp/services/auth/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCuibt extends Cubit<ForgetPasswordState> {
  ForgetPasswordCuibt() : super(ForgetPasswordIntial());

  Future<void> resetPassword(
      {required String email, required dynamic context}) async {
    try {
      emit(ForgetPasswordLoading());
      await AuthServices().resetPassword(email: email, context: context);

      emit(ForgetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ForgetPasswordFailure(errorMessage: e.code));
    } catch (e) {
      emit(ForgetPasswordFailure(errorMessage: e.toString()));
    }
  }
}
