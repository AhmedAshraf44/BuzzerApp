import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/function/build_app_bar.dart';
import '../manger/cubit/app_cubit.dart';
import 'widgets/build_bottom_nav_bar_app_layout.dart';

class AppLayoutView extends StatelessWidget {
  const AppLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: buildAppLyoutAppbar(),
            bottomNavigationBar: BuildBottomNavBarAppLayout(cubit: cubit),
            body: cubit.pages[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
