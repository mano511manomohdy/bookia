import 'package:bloc/bloc.dart';
import 'package:bokkia/features/cart/data/models/add_to_cart_response/add_to_cart_response.dart';
import 'package:bokkia/features/cart/data/repo/AddToCartRepo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  AddToCartResponse? showdata;

  Future<void> getCart() async {
    emit(CartLoadingState());
    try {
      await Addtocartrepo.showCart().then((value) {
        if (value != null) {
          showdata = value;
          emit(CartSuccessState());
        } else {
          emit(CartFailureState(error: "error"));
        }
      });
    } catch (e) {
      emit(CartFailureState(error: e.toString()));
    }
  }

  Future<void> addToCart(int productId) async {
    emit(CartLoadingState());
    try {
      await Addtocartrepo.addToCart(productId).then((value) {
        if (value == true) {
          emit(CartSuccessState());
        } else {
          emit(CartFailureState(error: "error"));
        }
      });
    } catch (e) {
      emit(CartFailureState(error: "error"));
    }
  }

  Future<void> removeFromCart(int cartItemId) async {
    emit(CartLoadingState());
    try {
      await Addtocartrepo.removeCart(cartItemId).then((value) {
        if (value != null) {
          showdata = value;
          emit(CartSuccessState());
        } else {
          emit(CartFailureState(error: "error"));
        }
      });
    } catch (e) {
      emit(CartFailureState(error: "error"));
    }
  }
}
