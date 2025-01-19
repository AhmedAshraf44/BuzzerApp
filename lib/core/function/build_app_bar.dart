import 'package:flutter/material.dart';

import '../../constants.dart';
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
