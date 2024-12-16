import 'package:authapp/core/services/auth/auth_google_services.dart';
import 'package:authapp/core/services/auth/auth_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthServices authServices;
  final AuthGoogleServices googleServices;

  AuthCubit({
    required this.authServices,
    required this.googleServices,
  }) : super(AuthInitial());

  /// تسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور
  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final userCredential = await authServices.loginWithEmail(
        email: email,
        password: password,
      );

      final User? user = userCredential?.user;

      if (user != null) {
        if (!user.emailVerified) {
          emit(AuthEmailNotVerified());
        } else {
          emit(AuthLoginSuccess(user: user));
        }
      } else {
        emit(AuthFailure(errorMessage: "User not found."));
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  /// التسجيل باستخدام البريد الإلكتروني وكلمة المرور
  Future<void> registerWithEmail({
    required String userName,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final userCredential = await authServices.registerWithEmail(
        userName: userName,
        email: email,
        password: password,
      );

      final User? user = userCredential?.user;

      if (user != null) {
        emit(AuthRegistrationSuccess(user: user));
      } else {
        emit(AuthFailure(errorMessage: "Registration failed. User not found."));
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  /// تسجيل الدخول باستخدام Google
  Future<void> loginWithGoogle() async {
    emit(AuthLoading());
    try {
      final User? user = await googleServices.signInWithGoogle();
      if (user != null) {
        emit(AuthLoginSuccess(user: user));
      } else {
        emit(AuthFailure(errorMessage: "Google login failed."));
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  /// إعادة تعيين كلمة المرور
  Future<void> resetPassword({required String email}) async {
    emit(AuthLoading());
    try {
      await authServices.resetPassword(email: email);
      emit(AuthPasswordResetSuccess());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  /// تسجيل الخروج
  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await googleServices.signOut();
      emit(AuthLoggedOut());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}


/*
class AuthCubit extends Cubit<AuthState> {
  final AuthServices authServices;
  final AuthGoogleServices googleServices;

  AuthCubit({
    required this.authServices,
    required this.googleServices,
  }) : super(AuthInitial());

  /// تسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required dynamic context,
  }) async {
    emit(AuthLoading());
    try {
      await authServices.loginWithEmail(
          email: email, password: password, context: context);

      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(errorMessage: "User not found."));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(errorMessage: e.code));
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  /// التسجيل باستخدام Google
  Future<void> registerWithGoogle(BuildContext context) async {
    emit(AuthLoading());
    try {
      await googleServices.signInWithGoogle(context);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(errorMessage: e.code));
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  /// إعادة تعيين كلمة المرور
  Future<void> resetPassword({
    required String email,
    required dynamic context,
  }) async {
    emit(AuthLoading());
    try {
      await authServices.resetPassword(email: email, context: context);
      emit(AuthPasswordResetSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(errorMessage: e.code));
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  /// التسجيل باستخدام البريد الإلكتروني وكلمة المرور
  Future<void> registerWithEmail({
    required String userName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(AuthLoading());
    try {
      // استدعاء خدمة التسجيل
      await authServices.registerWithEmail(
        userName: userName,
        email: email,
        password: password,
        context: context,
      );

      // التحقق من حالة المستخدم بعد التسجيل
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(errorMessage: "Registration failed. User not found."));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(errorMessage: e.code));
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  /// تسجيل الخروج
  Future<void> logout(BuildContext context) async {
    emit(AuthLoading());
    try {
      await googleServices.signOut(context);
      emit(AuthLoggedOut());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}
*/