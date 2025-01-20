import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomTextFeildAppBar extends StatelessWidget {
  const CustomTextFeildAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          child: Container(
              // height: 45,
              width: 47,
              decoration: BoxDecoration(
                color: kButtonColor,
              ),
              child: SvgPicture.asset(
                Assets.imagesSearch,
                fit: BoxFit.scaleDown,
              )),
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
        hintText: 'Enter Location',
        filled: true,
        hintStyle: AppStyles.textStyle14Regular
            .copyWith(color: Color(0xff999999), fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
