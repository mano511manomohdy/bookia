import 'dart:developer';

import 'package:bokkia/features/cart/data/repo/AddToCartRepo.dart';
import 'package:bokkia/features/wishlist/data/models/get_wishlist_response/get_wishlist_response.dart';
import 'package:bokkia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());
  GetWishlistResponse? getwishlist;
  Future<void> getWishlist() async {
    emit(GetWishListLoading());
    try {
      final value = await WishlistRepo.getWishList();
      if (value != null) {
        getwishlist = value;
        emit(GetWishListsuccess());
      } else {
        emit(GetWishListfailure(error: "Failed to fetch wishlist"));
      }
    } on Exception catch (e) {
      log(e.toString());
      emit(GetWishListfailure(error: e.toString()));
    }
  }

  Future<void> removeWishlist(int productId) async {
    emit(GetWishListLoading());

    try {
      await WishlistRepo.removeWishList(productId).then((value) {
        getwishlist = value;
        if (value != null) {
          emit(GetWishListsuccess());
        } else {
          emit(GetWishListfailure(error: "error"));
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      emit(GetWishListfailure(error: e.toString()));
    }
  }

  Future<void> addToCart(int productId) async {
    emit(AddToCartLoading());
    try {
      await Addtocartrepo.addToCart(productId).then((value) {
        if (value == true) {
          emit(AddToCartSuccess());
        } else {
          emit(AddToCartFailure(error: "Failed to add to cart"));
        }
      });
    } catch (e) {
      emit(AddToCartFailure(error: "error"));
    }
  }
}
