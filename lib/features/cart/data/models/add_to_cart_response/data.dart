import 'cart_item.dart';
import 'user.dart';

class Data {
  int? id;
  User? user;
  dynamic total;
  List<CartItem>? cartItems;

  Data({this.id, this.user, this.total, this.cartItems});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'] as int?,
    user: json['user'] != null && json['user'] is Map<String, dynamic>
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : null,
    total: json['total'] as dynamic,
    cartItems: json['cart_items'] != null && json['cart_items'] is List<dynamic>
        ? (json['cart_items'] as List<dynamic>)
              .map(
                (e) => e is Map<String, dynamic> ? CartItem.fromJson(e) : null,
              )
              .whereType<CartItem>()
              .toList()
        : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user?.toJson(),
    'total': total,
    'cart_items': cartItems?.map((e) => e.toJson()).toList(),
  };
}
