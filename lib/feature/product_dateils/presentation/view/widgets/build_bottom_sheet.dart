import 'dart:developer';
import 'package:buzzer_app/core/utils/model/cart_manger.dart';
import 'package:buzzer_app/feature/layout/presentation/manger/cubit/app_cubit.dart';
import 'package:buzzer_app/feature/product_dateils/presentation/manger/cubit/counter/counter_cubit.dart';
import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_row_button_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/model/product.dart';
import '../../../data/repos/product_datails_repo_impl.dart';
import '../../manger/cubit/product_details/product_details_cubit.dart';
import 'add_product_bottom_sheet.dart';

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductDetailsCubit(getIt.get<ProductDatailsRepoImpl>()),
          //create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          var cubit = ProductDetailsCubit.get(context);
          return BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              int counter = CounterCubit.get(context).counter;

              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(width: 1, color: Colors.grey.shade300),
                    )),
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 11),
                  child: Row(
                    children: [
                      CustomRowButtonBottomSheet(),
                      SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: CustomButton(
                          onTap: () async {
                            if (CartManger.cartItem.isEmpty) {
                              CartManger.cartItem.add(product);
                              cubit.addDataToCartFireStore(CartManger.cartItem);
                              AppCubit.get(context)
                                  .updateProductQuantity(product.id!, counter);
                              // log('counter 1 :' + counter.toString());
                              //  log(CartManger.cartItem.length.toString());
                            } else {
                              bool productExists = false;

                              for (var element in CartManger.cartItem) {
                                if (element.id == product.id) {
                                  productExists = true;
                                  break;
                                }
                              }

                              if (!productExists) {
                                CartManger.cartItem.add(product);
                                cubit.addDataToCartFireStore(
                                    CartManger.cartItem);
                                AppCubit.get(context).updateProductQuantity(
                                    product.id!, counter);
                                //  log('counter 2 :' + counter.toString());
                                // log(CartManger.cartItem.length.toString());
                              } else {
                                log("Product already in cart.");
                              }
                            }
                            showModalBottomSheet(
                              isDismissible: true,
                              backgroundColor:
                                  Colors.transparent.withValues(alpha: .4),
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Center(
                                    child: AspectRatio(
                                      aspectRatio: 1 / 0.6,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey
                                                  .withValues(alpha: 0.5),
                                              spreadRadius: 4,
                                              blurRadius: 6,
                                              offset: const Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                        child: const AddProductBottomSheet(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          text: 'ADD TO BASKET',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Future<void> addDataToCartFireStore(List<Product> products) async {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   List<Map<String, dynamic>> cartData =
//       products.map((product) => product.toJson()).toList();
//   try {
//     await firestore.collection(kCart).doc(kuId).set({
//       "products": cartData,
//     });
//     log('Cart data added to Firestore.');
//   } catch (error) {
//     log('Error adding cart data to Firestore: $error');
//   }
// }
