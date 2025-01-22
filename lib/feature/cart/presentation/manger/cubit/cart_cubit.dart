import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/cart_model/cart.dart';
import '../../../data/repos/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitialState());
  static CartCubit get(context) => BlocProvider.of(context);

  int subTotal = 0;
  getSubTolal(int subt) {
    subTotal += subt;
    log(subTotal.toString());
    emit(CartsubTotalState());
  }

  final CartRepo cartRepo;

  // DocumentReference docRef =
  //     FirebaseFirestore.instance.collection(kCart).doc(kuId);
  CartModel? model;
  Future<void> getCartData() async {
    emit(CartLoadingState());
    var result = await cartRepo.getCartData();
    result.fold(
        (failure) => emit(CartFailureState(errorMessage: failure.message)),
        (succes) {
      model = succes;
      return emit(CartSuccessState());
    });
  }
}
//var uId = CacheHelper.getData(key: 'uId');
//     await FirebaseFirestore.instance.collection(kCart).doc(kuId).get().then(
//       (value) {
//         model = CartModel.fromJson(value.data()!);
//         log(model?.products?.length.toString() ?? "");
// //log(model?.products![0].quantity.toString() ?? "");

//         emit(CartSuccessState());
//       },
//     ).catchError(
//       (error) {
//         log(error.toString());
//         emit(CartFailureState(errorMessage: error.toString()));
//       },
//     );
//   }

  // Future<void> deleteFirstProduct(int index) async {
  //   DocumentReference docRef =
  //       FirebaseFirestore.instance.collection(kCart).doc(kuId);
  //   FirebaseFirestore.instance.runTransaction((transaction) async {
  //     DocumentSnapshot docSnapshot = await transaction.get(docRef);

  //     if (docSnapshot.exists) {
  //       List<dynamic> products = docSnapshot['products'];

  //       if (products.isNotEmpty) {
  //         products.removeAt(index);

  //         transaction.update(docRef, {
  //           'products': products,
  //         });

  //         print("First product deleted successfully.");
  //       } else {
  //         print("No products to delete.");
  //       }
  //     } else {
  //       print("Document does not exist.");
  //     }
  //   }).catchError((error) {
  //     print("Failed to delete product: $error");
  //   });
  // }