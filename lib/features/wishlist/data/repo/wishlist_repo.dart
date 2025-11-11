import 'dart:developer';

import 'package:bokkia/core/constants/endpoints.dart';
import 'package:bokkia/core/services/dio_provider.dart';
import 'package:bokkia/core/services/local_data_helper.dart';
import 'package:bokkia/features/wishlist/data/models/get_wishlist_response/get_wishlist_response.dart';

class WishlistRepo {
  static Future<bool> addToWishList(int productId) async {
    try {
      var res = await DioProvider.post(
        path: Endpoints.addToWishList,
        data: {"product_id": productId},
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getDate(AppLocalStorage.tokenkey)}",
        },
      );
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<GetWishlistResponse?> getWishList() async {
    try {
      var res = await DioProvider.get(
        path: Endpoints.getWishList,
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getDate(AppLocalStorage.tokenkey)}",
        },
      );
      if (res.statusCode == 200) {
        return GetWishlistResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<GetWishlistResponse?> removeWishList(int productId) async {
    try {
      var res = await DioProvider.post(
        path: Endpoints.removeFromWishList,
        data: {"product_id": productId},
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getDate(AppLocalStorage.tokenkey)}",
        },
      );
      if (res.statusCode == 200) {
        return GetWishlistResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
