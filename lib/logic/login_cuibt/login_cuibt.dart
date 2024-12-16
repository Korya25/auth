import 'package:authapp/logic/login_cuibt/login_state.dart';
import 'package:authapp/core/services/auth/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthServices authService;
  LoginCubit(this.authService) : super(LoginIntial());

  Future<void> loginWithEmail({
    required String email,
    required String password,
    required dynamic context,
  }) async {
    try {
      emit(LoginLoading());

      // استدعاء تسجيل الدخول من AuthServices
      final result = await authService.loginWithEmail(
          email: email, password: password, context: context);

      // التحقق من حالة المستخدم بعد تسجيل الدخول
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        if (!user.emailVerified) {
          // البريد الإلكتروني غير مُحقق
          emit(LoginEmailNotVerified());
        } else {
          // تسجيل الدخول بنجاح
          emit(LoginSuccess());
        }
      } else {
        emit(LoginFailure(errorMessage: "User not found."));
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(errorMessage: e.code));
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}
