import 'package:buzzer_app/feature/layout/presentation/manger/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'build_home_list_view_item.dart';

class BuildHomeListView extends StatelessWidget {
  const BuildHomeListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: cubit.model!.restaurant!.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 17),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kProductView,
                  extra: cubit.model!.restaurant![index].products!);
            },
            child: BuildHomeListViewItem(
              restaurants: cubit.model!.restaurant![index],
            ),
          ),
        ),
      ),
    );
  }
}
