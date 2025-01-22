import 'package:buzzer_app/core/utils/widgets/custom_button.dart';
import 'package:buzzer_app/feature/cart/data/repos/cart_repo_impl.dart';
import 'package:buzzer_app/feature/cart/presentation/manger/cubit/cart_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/utils/app_styles.dart';
import 'widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(
      //   title: 'Basket',
      //   leadingWidth: 40,
      // ),
      // bottomSheet: Container(
      //   color: Colors.white,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 13),
      //     child: CustomButton(
      //       width: double.infinity,
      //       text: 'PROCEED TO CHECKOUT',
      //       onTap: () {},
      //     ),
      //   ),
      // ),
      body: BlocProvider(
        create: (context) => CartCubit(
          getIt.get<CartRepoImpl>(),
        )..getCartData(),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            var cubit = CartCubit.get(context);
            return ConditionalBuilder(
              condition: state is! CartLoadingState,
              builder: (context) {
                return cubit.model != null && cubit.model!.products!.isNotEmpty
                    ? SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 13,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(
                              //   'Park Lane Hotel',
                              //   style: AppStyles.textStyle18Bold.copyWith(
                              //     color: Colors.black,
                              //   ),
                              // ),
                              // Text(
                              //   'Restaurant',
                              //   style: AppStyles.textStyle18Regular.copyWith(
                              //     color: Color(0xffEC362B),
                              //   ),
                              // ),
                              CartViewBody(
                                cubit: cubit,
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: CustomButton(
                                  width: double.infinity,
                                  text: 'PROCEED TO CHECKOUT',
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ))
                    : Center(
                        child: Text(
                        'No Cart Items',
                        style: AppStyles.textStyle18Bold
                            .copyWith(color: Colors.black),
                      ));
              },
              fallback: (context) => Center(
                child: CircularProgressIndicator(
                  color: kButtonColor,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
