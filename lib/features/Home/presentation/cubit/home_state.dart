part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeSlideLoading extends HomeState {}

final class HomeSliderSuccess extends HomeState {}

final class HomeSliderFailure extends HomeState {
  final String error;

  HomeSliderFailure({required this.error});
}

final class HomeBestSellerLoading extends HomeState {}

final class HomeBestSellersuccess extends HomeState {}

final class HomeBestSellerfailure extends HomeState {
  final String error;

  HomeBestSellerfailure({required this.error});
}
