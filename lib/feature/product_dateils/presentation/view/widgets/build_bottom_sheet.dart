import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_row_button_bottom_sheet.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../layout/data/model/restaurant_model/product.dart';
import 'add_product_bottom_sheet.dart';

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: Colors.grey.shade300),
          )),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 11),
        child: Row(
          children: [
            CustomRowButtonBottomSheet(),
            SizedBox(
              width: 13,
            ),
            // BlocProvider(
            //   create: (context) => AppCubit(),
            //   child: BlocBuilder<AppCubit, AppState>(
            //     builder: (context, state) {
            // return
            Expanded(
              child: CustomButton(
                onTap: () {
                  //             log(product.id.toString());
                  //             AppCubit.get(context).updateCart();
                  showModalBottomSheet(
                    isDismissible: true,
                    backgroundColor: Colors.transparent.withValues(alpha: .4),
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: 1 / 0.5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.5),
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
            //   },
            //),
            // ),
          ],
        ),
      ),
    );
  }
}
