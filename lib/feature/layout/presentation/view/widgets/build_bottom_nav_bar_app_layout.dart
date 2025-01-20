import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import '../../../../../core/function/build_bottom_navy_bar_item.dart';
import '../../../../../core/utils/app_images.dart';
import '../../manger/cubit/app_cubit.dart';

class BuildBottomNavBarAppLayout extends StatelessWidget {
  const BuildBottomNavBarAppLayout({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .25),
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        child: BottomNavyBar(
            onItemSelected: (index) {
              cubit.changeBottomNavIndex(index);
            },
            selectedIndex: cubit.currentIndex,
            itemPadding: EdgeInsets.only(left: 10),
            containerHeight: 60,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            items: [
              buildBottomNavyBarItem(
                  title: 'HOME',
                  assetName: Assets.imagesHome,
                  index: 0,
                  cubit: cubit),
              buildBottomNavyBarItem(
                title: 'Notifications',
                assetName: Assets.imagesNov,
                index: 1,
                cubit: cubit,
                left: 3,
              ),
              buildBottomNavyBarItem(
                title: 'Profile',
                assetName: Assets.imagesProfile,
                index: 2,
                cubit: cubit,
              ),
            ]),
      ),
    );
  }
}
