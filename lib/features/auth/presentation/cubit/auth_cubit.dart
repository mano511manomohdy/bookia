import 'package:bokkia/features/auth/data/model/request/auth_request.dart';
import 'package:bokkia/features/auth/data/repo/auth_repo.dart';
import 'package:bokkia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bokkia/features/auth/presentation/page/forget_password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthStateInitial());

  Future<void> register(AuthRequest params) async {
    emit(AuthStateLoading());
    try {
      final value = await AuthRepo.register(params);
      if (value != null) {
        emit(AuthStateSuccess());
      } else {
        emit(AuthStateError("Register Failed"));
      }
    } catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }

  Future<void> login(AuthRequest params) async {
    emit(AuthStateLoading());
    try {
      final value = await AuthRepo.login(params);
      if (value != null) {
        emit(AuthStateSuccess());
      } else {
        emit(AuthStateError("Login Failed"));
      }
    } catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }

  Future<void> forgetPassword(AuthRequest params) async {
    emit(AuthStateLoading());
    try {
      final value = await AuthRepo.forgetPassword(params);
      if (value != null) {
        emit(AuthStateSuccess());
      } else {
        emit(AuthStateError("Forget Password Failed"));
      }
    } catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }
}
