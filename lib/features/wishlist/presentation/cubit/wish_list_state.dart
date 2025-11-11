part of 'wish_list_cubit.dart';

sealed class WishListState {}

final class WishListInitial extends WishListState {}

final class GetWishListLoading extends WishListState {}

final class GetWishListsuccess extends WishListState {}

final class GetWishListfailure extends WishListState {
  final String error;

  GetWishListfailure({required this.error});
}

final class RemoveWishListLoading extends WishListState {}

final class RemoveWishListSuccess extends WishListState {}

final class RemoveWishListFailure extends WishListState {
  final String error;

  RemoveWishListFailure({required this.error});
}
