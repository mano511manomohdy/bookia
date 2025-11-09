import 'package:bokkia/features/auth/data/model/request/auth_request.dart';
import 'package:bokkia/features/auth/data/model/request/otp_verification_request.dart';
import 'package:bokkia/features/auth/data/model/request/rest_password_request.dart';
import 'package:bokkia/features/auth/data/repo/auth_repo.dart';
import 'package:bokkia/features/auth/presentation/cubit/auth_state.dart';
import 'package:dio/dio.dart';
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
      final response = await AuthRepo.forgetPassword(params);

      if (response != null) {
        if (response.status == 200) {
          emit(AuthStateSuccess());
        } else {
          // Server responded with an error message
          emit(AuthStateError(response.message ?? "Unknown server error"));
        }
      } else {
        emit(AuthStateError("No response from server"));
      }
    } on DioException catch (e) {
      // Handle known Dio errors
      if (e.response != null) {
        final statusCode = e.response?.statusCode;
        final message = e.response?.data?["message"] ?? "Server error";

        if (statusCode == 422) {
          emit(AuthStateError("Invalid input: $message"));
        } else if (statusCode == 404) {
          emit(AuthStateError("Email not found"));
        } else if (statusCode == 500) {
          emit(AuthStateError("Internal Server Error"));
        } else {
          emit(AuthStateError("Server Error ($statusCode): $message"));
        }
      } else {
        // Dio had no response at all (network error, timeout, etc.)
        emit(AuthStateError("Connection error: ${e.message}"));
      }
    } catch (e) {
      emit(AuthStateError("Unexpected error: $e"));
    }
  }

  Future<void> verify(OtpVerificationRequest params) async {
    emit(AuthStateLoading());
    try {
      final value = await AuthRepo.verfiy(params);
      if (value != null) {
        emit(AuthStateSuccess());
      } else {
        emit(AuthStateError("OTP Verification Failed"));
      }
    } on Exception catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }

  Future<void> resendVerifyCode() async {
    emit(AuthStateLoading());
    try {
      final value = await AuthRepo.resendVerfiyCode();
      if (value != null) {
        emit(AuthStateSuccess());
      } else {
        emit(AuthStateError("Resend OTP Failed"));
      }
    } on Exception catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }

  Future<void> resetPassword(RestPasswordRequest params) async {
    emit(AuthStateLoading());
    try {
      final value = await AuthRepo.resetPassword(params);
      if (value != null) {
        emit(AuthStateSuccess());
      } else {
        emit(AuthStateError("Reset Password Failed"));
      }
    } catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }
}
