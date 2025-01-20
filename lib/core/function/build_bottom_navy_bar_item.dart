import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../feature/layout/presentation/manger/cubit/app_cubit.dart';
import '../utils/app_styles.dart';

buildBottomNavyBarItem({
  required AppCubit cubit,
  required String title,
  required String assetName,
  required int index,
  double left = 10,
}) =>
    BottomNavyBarItem(
      icon: Padding(
        padding: EdgeInsets.only(left: left),
        child: SvgPicture.asset(
            width: 20,
            assetName,
            colorFilter: cubit.currentIndex == index
                ? ColorFilter.mode(
                    kButtonColor,
                    BlendMode.srcIn,
                  )
                : ColorFilter.mode(
                    kTextColor,
                    BlendMode.srcIn,
                  )),
      ),
      title: Text(
        title,
        style: AppStyles.textStyle20Bold.copyWith(
          color: kButtonColor,
        ),
      ),
      activeColor: kButtonColor,
      inactiveColor: kTextColor,
      //  textAlign: TextAlign.center,
    );
