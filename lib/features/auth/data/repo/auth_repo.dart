import 'dart:developer';

import 'package:bokkia/core/services/dio_provider.dart';
import 'package:bokkia/features/auth/data/model/request/auth_request.dart';
import 'package:bokkia/features/auth/data/model/response/auth_response/auth_response.dart';
import 'package:bokkia/features/auth/presentation/page/forget_password.dart';

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
}
