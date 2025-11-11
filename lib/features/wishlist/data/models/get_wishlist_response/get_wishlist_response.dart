import 'package:bokkia/features/Home/data/models/best_seller_response/product.dart';

class GetWishlistResponse {
  List<Product>? data;
  String? message;
  List<dynamic>? error;
  int? status;

  GetWishlistResponse({this.data, this.message, this.error, this.status});

  factory GetWishlistResponse.fromJson(Map<String, dynamic> json) {
    List<Product> products = [];

    // Access the nested 'data' list inside the pagination object
    if (json['data'] != null && json['data']['data'] != null) {
      final list = json['data']['data'] as List;
      products = list.map((e) => Product.fromJson(e)).toList();
    }

    return GetWishlistResponse(
      data: products,
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.map((e) => e.toJson()).toList(),
    'message': message,
    'error': error,
    'status': status,
  };
}
