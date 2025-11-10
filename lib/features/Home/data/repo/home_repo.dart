import 'dart:developer';
import 'package:bokkia/core/constants/endpoints.dart';
import 'package:bokkia/core/services/dio_provider.dart';
import 'package:bokkia/features/Home/data/models/best_seller_response/best_seller_response.dart';
import 'package:bokkia/features/Home/data/models/slider_response/slider_response.dart';

class HomeRepo {
  static Future<SliderResponse?> getSliders() async {
    try {
      var res = await DioProvider.get(path: Endpoints.sliders);
      if (res.statusCode == 200) {
        return SliderResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<BestSellerResponse?> getBestSeller() async {
    try {
      var res = await DioProvider.get(path: Endpoints.bestSeller);
      if (res.statusCode == 200) {
        return BestSellerResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
