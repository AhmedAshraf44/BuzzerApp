import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants.dart';
import '../../../layout/presentation/manger/cubit/app_cubit.dart';
import 'widgets/build_home_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return ConditionalBuilder(
          condition: cubit.model != null,
          //condition: state is! AppLayoutLoadingState,
          builder: (context) => BuildHomeListView(),
          //  BuildLoginView(cubit: LoginCubit.get(context)),
          fallback: (context) => const Center(
              child: CircularProgressIndicator(
            color: kButtonColor,
            //backgroundColor: kTextColor
          )),
        );
      },
    );
  }
}
