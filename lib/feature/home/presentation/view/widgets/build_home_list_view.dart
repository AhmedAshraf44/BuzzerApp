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
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 17),
        child: InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kProductView);
          },
          child: BuildHomeListViewItem(),
        ),
      ),
    );
  }
}
