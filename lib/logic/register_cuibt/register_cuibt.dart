import 'package:authapp/logic/register_cuibt/register_state.dart';
import 'package:authapp/services/auth/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterIntial());

  Future<void> register(
      {required String userName,
      required String email,
      required String password,
      required dynamic context}) async {
    try {
      emit(RegisterLoading());
      await AuthServices().registerWithEmail(
          userName: userName,
          email: email,
          password: password,
          context: context);

      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure(errorMessage: e.code));
    } catch (e) {
      emit(RegisterFailure(errorMessage: e.toString()));
    }
  }
}
