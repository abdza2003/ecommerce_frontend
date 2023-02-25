import 'package:advanceproje/controller/home/getPages_controller.dart';
import 'package:advanceproje/core/constant/color_manager.dart';
import 'package:advanceproje/core/constant/image_manager.dart';
import 'package:advanceproje/view/screen/homePage_screen.dart';
import 'package:advanceproje/view/widget/home/screensButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class getPagesScreen extends StatefulWidget {
  @override
  State<getPagesScreen> createState() => _getPagesScreenState();
}

class _getPagesScreenState extends State<getPagesScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetPagesControllerImp>(builder: (controller) {
      return Scaffold(
          body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          controller.getPagesInfo[controller.pageIndex]['child'],
          ScreensButtonWidget(),
        ],
      ));
    });
  }
}
