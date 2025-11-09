import 'dart:developer';
import 'package:bokkia/core/services/dio_provider.dart';
import 'package:bokkia/features/auth/data/model/request/auth_request.dart';
import 'package:bokkia/features/auth/data/model/request/otp_verification_request.dart';
import 'package:bokkia/features/auth/data/model/request/rest_password_request.dart';
import 'package:bokkia/features/auth/data/model/response/auth_response/auth_response.dart';
import 'package:bokkia/features/auth/data/model/response/otp_response/otp_response/otp_response.dart';
import 'package:bokkia/features/auth/data/model/response/reset_password_response/reset_password_response/reset_password_response.dart';

class AuthRepo {
  static Future<AuthResponse?> register(AuthRequest params) async {
    try {
      var res = await DioProvider.post(path: "register", data: params.toJson());

      if (res.statusCode == 201) {
        return AuthResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(AuthRequest params) async {
    try {
      var res = await DioProvider.post(path: "login", data: params.toJson());

      if (res.statusCode == 200) {
        return AuthResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> forgetPassword(AuthRequest params) async {
    try {
      var res = await DioProvider.post(
        path: "forget-password",
        data: params.toJson(),
      );

      if (res.statusCode == 200) {
        return AuthResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<OtpResponse?> verfiy(OtpVerificationRequest params) async {
    try {
      var res = await DioProvider.post(
        path: 'check-forget-password',
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        return OtpResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<OtpResponse?> resendVerfiyCode() async {
    try {
      var res = await DioProvider.get(path: 'resend-verify-code');
      if (res.statusCode == 200) {
        return OtpResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<ResetPasswordResponse?> resetPassword(
    RestPasswordRequest params,
  ) async {
    try {
      var res = await DioProvider.post(
        path: "reset-password",
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        return ResetPasswordResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
