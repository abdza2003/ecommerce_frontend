import 'package:advanceproje/core/constant/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FiltreButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        onPressed: () {},
        child: Container(
          margin: EdgeInsets.all(3),
          child: SvgPicture.asset(
            ImageManager.iconFiltre,
            color: Colors.white,
            width: 25,
            height: 25,
          ),
        ),
      ),
    );
  }
}
