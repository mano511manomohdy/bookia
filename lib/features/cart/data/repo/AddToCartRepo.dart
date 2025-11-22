import 'dart:developer';
import 'package:bokkia/core/constants/endpoints.dart';
import 'package:bokkia/core/services/dio_provider.dart';
import 'package:bokkia/core/services/local_data_helper.dart';
import 'package:bokkia/features/cart/data/models/add_to_cart_response/add_to_cart_response.dart';
import 'package:dio/dio.dart';

class Addtocartrepo {
  static Future<bool> addToCart(int productId) async {
    try {
      var res = await DioProvider.post(
        path: Endpoints.addToCart,
        data: {"product_id": productId},
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getDate(AppLocalStorage.tokenkey)}",
        },
      );
      if (res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<AddToCartResponse?> showCart() async {
    try {
      var res = await DioProvider.get(
        path: Endpoints.cart,
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getDate(AppLocalStorage.tokenkey)}",
        },
      );
      if (res.statusCode == 200) {
        return AddToCartResponse.fromJson(res.data);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AddToCartResponse?> removeCart(int cartItemId) async {
    try {
      var res = await DioProvider.post(
        path: Endpoints.removeFromCart,
        data: {"cart_item_id": cartItemId},
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getDate(AppLocalStorage.tokenkey)}",
        },
      );
      if (res.statusCode == 200) {
        return AddToCartResponse.fromJson(res.data);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AddToCartResponse?> updateCart(
    int cartItemId,
    int quantity,
  ) async {
    try {
      var res = await DioProvider.post(
        path: Endpoints.updateCart,
        data: {"cart_item_id": cartItemId, "quantity": quantity},
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getDate(AppLocalStorage.tokenkey)}",
        },
      );
      if (res.statusCode == 201) {
        return AddToCartResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      print("🔥 DIO ERROR MESSAGE: ${e.response?.data}");
      print("🔥 STATUS CODE: ${e.response?.statusCode}");
      print("🔥 HEADERS: ${e.response?.headers}");
      log(e.toString());
      return null;
    }
  }
}
