import 'package:buzzer_app/feature/product_dateils/data/repos/product_datails_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/model/product.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.repo) : super(ProductDetailsInitialState(0));

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  final ProductDatailsRepo repo;

  Future<void> addDataToCartFireStore(List<Product> products) async {
    emit(ProductDetailsLoadingState());
    var result = await repo.addDataToCartFireStore(products);
    result.fold(
      (failur) =>
          emit(ProductDetailsFailureState(errorMessges: failur.message)),
      (succes) => emit(ProductDetailsSuccessState()),
    );
  }
}
