import 'package:authapp/logic/register_cuibt/register_state.dart';
import 'package:authapp/services/auth/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterIntial());

  Future<void> register(
      {required String userName,
      required String email,
      required String password,
      required dynamic formKey,
      required dynamic context}) async {
    try {
      emit(RegisterLoading());
      await AuthController().register(
          userName: userName,
          email: email,
          password: password,
          formKey: formKey,
          context: context);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure(errorMessage: e.code));
    } catch (e) {
      emit(RegisterFailure(errorMessage: e.toString()));
    }
  }
}

/*
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Future<void> userRegister(
      {required String email,
      required String password,
      required String userName}) async {
    try {
      emit(RegisterLoading());
      await FirebaseService.register(
          email: email, password: password, userName: userName);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (err) {
      emit(RegisterFailure(message: err.code));
    } catch (err) {
      emit(RegisterFailure(message: err.toString()));
    }
  }
}

*/
