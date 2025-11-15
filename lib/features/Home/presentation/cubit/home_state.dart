part of 'home_cubit.dart';

sealed class HomeState {}

//states of sliders
final class HomeInitial extends HomeState {}

final class HomeSlideLoading extends HomeState {}

final class HomeSliderSuccess extends HomeState {}

final class HomeSliderFailure extends HomeState {
  final String error;

  HomeSliderFailure({required this.error});
}

//states of bestSellers
final class HomeBestSellerLoading extends HomeState {}

final class HomeBestSellersuccess extends HomeState {}

final class HomeBestSellerfailure extends HomeState {
  final String error;

  HomeBestSellerfailure({required this.error});
}

//states of Add to Wishlist
final class AddWishlistLoadingState extends HomeState {}

final class AddWishlistSuccessState extends HomeState {
  final String message;

  AddWishlistSuccessState({required this.message});
}

final class AddWishlistFailureState extends HomeState {
  final String error;

  AddWishlistFailureState({required this.error});
}

final class AddCartLoadingState extends HomeState {}

final class AddCartSuccessState extends HomeState {}

final class AddCartFailureState extends HomeState {
  final String error;

  AddCartFailureState({required this.error});
}
