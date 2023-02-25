import 'package:advanceproje/core/constant/color_manager.dart';
import 'package:advanceproje/core/constant/font_manager.dart';
import 'package:advanceproje/core/constant/image_manager.dart';
import 'package:advanceproje/core/constant/mediaQuery_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Card(
        elevation: 10,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: TextField(
          cursorColor: ColorManager.primaryGradation2,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(22),
            hintText: 'Search clothes ...',
            hintStyle: FontManager.mediumStyle.copyWith(color: Colors.black45),
            prefixIcon: Container(
              // color: Colors.red,
              padding: EdgeInsets.only(
                top: MediQueryManager(context).height / 100,
                left: MediQueryManager(context).height / 100,
              ),
              child: SvgPicture.asset(
                ImageManager.iconSearch,
                height: 50,
                width: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
