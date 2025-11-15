import 'data.dart';

class AddToCartResponse {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  AddToCartResponse({this.data, this.message, this.error, this.status});

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) {
    return AddToCartResponse(
      data: json['data'] != null && json['data'] is Map<String, dynamic>
          ? Data.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      message: json['message'] as String?,
      error: json['error'] is List<dynamic>
          ? json['error'] as List<dynamic>
          : null,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.toJson(),
    'message': message,
    'error': error,
    'status': status,
  };
}
