import 'package:bokkia/features/auth/data/model/request/auth_request.dart';
import 'package:bokkia/features/auth/data/repo/auth_repo.dart';
import 'package:bokkia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthStateInitial());

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  register(AuthRequest params) {
    emit(AuthStateLoading());
    AuthRepo.register(params).then((value) {
      if (value != null) {
        emit(AuthStateSuccess());
      } else {
        emit(AuthStateError("Register Failed"));
      }
    });
  }

  login(AuthRequest params) {
    emit(AuthStateLoading());
    AuthRepo.login(params).then((value) {
      if (value != null) {
        emit(AuthStateSuccess());
      } else {
        emit(AuthStateError("Register Failed"));
      }
    });
  }
}
