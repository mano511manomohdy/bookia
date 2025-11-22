part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoadingState extends CartState {}

final class CartSuccessState extends CartState {}

final class CartFailureState extends CartState {
  final String error;

  CartFailureState({required this.error});
}

final class CartUpdateInitial extends CartState {}

final class CartUpdateLoadingState extends CartState {}

final class CartUpdateSuccessState extends CartState {}

final class CartUpdateFailureState extends CartState {
  final String error;

  CartUpdateFailureState({required this.error});
}
