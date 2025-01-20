import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../../feature/layout/presentation/view/widgets/custom_text_feild_app_bar.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';

PreferredSizeWidget buildAppBar({
  required String title,
  required double leadingWidth,
}) =>
    AppBar(
      leadingWidth: leadingWidth,
      leading: leadingWidth == 0 ? SizedBox() : null,
      backgroundColor: kPrimaryColor,
      title: Text(
        title,
        style: AppStyles.textStyle20Bold,
      ),
    );

PreferredSizeWidget buildAppLyoutAppbar() => AppBar(
      leading: SizedBox(),
      leadingWidth: 0,
      toolbarHeight: 160,
      backgroundColor: kPrimaryColor,
      title: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.imagesMenu),
              ),
              Text(
                'Buzzer App',
                style: AppStyles.textStyle20Bold,
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 50,
            child: CustomTextFeildAppBar(),
          ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
