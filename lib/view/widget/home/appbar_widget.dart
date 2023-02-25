import 'package:advanceproje/core/constant/color_manager.dart';
import 'package:advanceproje/core/constant/font_manager.dart';
import 'package:advanceproje/core/constant/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppbarWidget extends StatelessWidget {
  String? userName;
  AppbarWidget({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '0'.tr,
              style: FontManager.mediumStyle,
            ),
            const SizedBox(height: 5),
            Text(
              userName == null ? 'Undefine !!' : '$userName',
              style: FontManager.semiBoldStyle,
            )
          ],
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: ColorManager.silver.withOpacity(.6),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: ColorManager.primaryGradation2,
            child: SvgPicture.asset(
              ImageManager.iconProfileBold,
              color: Colors.white,
              width: 30,
              height: 30,
            ),
          ),
        ),
      ],
    );
  }
}
