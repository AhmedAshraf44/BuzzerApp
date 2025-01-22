part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitialState extends CartState {}

final class CartLoadingState extends CartState {}

final class CartSuccessState extends CartState {}

final class CartFailureState extends CartState {
  final String errorMessage;

  const CartFailureState({required this.errorMessage});
}

final class CartsubTotalState extends CartState {}
