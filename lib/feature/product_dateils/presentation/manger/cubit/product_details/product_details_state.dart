part of 'product_details_cubit.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsInitialState extends ProductDetailsState {
  final int counter;
  const ProductDetailsInitialState(this.counter);
}

final class ProductDetailsLoadingState extends ProductDetailsState {}

final class ProductDetailsSuccessState extends ProductDetailsState {}

final class ProductDetailsFailureState extends ProductDetailsState {
  final String errorMessges;

  const ProductDetailsFailureState({required this.errorMessges});
}
