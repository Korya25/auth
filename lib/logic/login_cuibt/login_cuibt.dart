import 'package:authapp/logic/login_cuibt/login_state.dart';
import 'package:authapp/services/auth/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginIntial());

  Future<void> loginWithEmail(
      {required String email,
      required String password,
      required dynamic context}) async {
    try {
      emit(LoginLoading());
      await AuthServices()
          .loginWithEmail(email: email, password: password, context: context);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(errorMessage: e.code));
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}
