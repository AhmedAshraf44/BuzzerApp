import 'package:buzzer_app/feature/product_dateils/presentation/manger/cubit/counter/counter_cubit.dart';
import 'package:buzzer_app/feature/product_dateils/presentation/view/widgets/custom_button_counter_sheet.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomRowButtonBottomSheet extends StatelessWidget {
  const CustomRowButtonBottomSheet({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var cubit = CounterCubit.get(context);
    return Row(
      children: [
        CustomButtonCounterSheet(
          containerColor: Colors.white,
          onTap: () {
            cubit.decrementNumber();
          },
          icon: Icons.remove,
          borderColor: kTextColor,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          cubit.counter.toString(),
          style: AppStyles.textStyle16Regular.copyWith(color: Colors.black),
        ),
        SizedBox(
          width: 8,
        ),
        CustomButtonCounterSheet(
          onTap: () {
            // context.read<CounterCubit>().incrementNumber();
            cubit.incrementNumber();
          },
          icon: Icons.add,
          borderColor: kTextColor,
          iconColor: Colors.white,
          containerColor: Colors.black,
        ),
      ],
    );
  }
}
