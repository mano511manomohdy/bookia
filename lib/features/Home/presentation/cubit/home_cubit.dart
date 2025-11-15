import 'package:bokkia/features/Home/data/models/best_seller_response/best_seller_response.dart';
import 'package:bokkia/features/Home/data/models/slider_response/slider_response.dart';
import 'package:bokkia/features/Home/data/repo/home_repo.dart';
import 'package:bokkia/features/cart/data/repo/AddToCartRepo.dart';
import 'package:bokkia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static SliderResponse? sliders;
  static BestSellerResponse? bestSeller;

  Future<void> getSliders() async {
    emit(HomeSlideLoading());
    await HomeRepo.getSliders().then((value) {
      if (value != null) {
        sliders = value;
        emit(HomeSliderSuccess());
      } else {
        emit(HomeSliderFailure(error: "error"));
      }
    });
  }

  Future<void> getBestSeller() async {
    emit(HomeBestSellerLoading());

    await HomeRepo.getBestSeller().then((value) {
      if (value != null) {
        bestSeller = value;
        emit(HomeBestSellersuccess());
      } else {
        emit(HomeBestSellerfailure(error: "error"));
      }
    });
  }

  Future<void> addToWishlist(int productId) async {
    emit(AddWishlistLoadingState());
    await WishlistRepo.addToWishList(productId).then((value) {
      if (value) {
        return emit(AddWishlistSuccessState(message: "Added to WishLis"));
      } else {
        return emit(AddWishlistFailureState(error: "error"));
      }
    });
  }

  Future<void> addToCart(int productId) async {
    emit(AddCartLoadingState());
    try {
      await Addtocartrepo.addToCart(productId).then((value) {
        if (value == true) {
          emit(AddCartSuccessState());
        } else {
          emit(AddCartFailureState(error: "Failed to add to cart"));
        }
      });
    } catch (e) {
      emit(AddCartFailureState(error: "error"));
    }
  }
}
