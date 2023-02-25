import 'package:advanceproje/controller/home/getPages_controller.dart';
import 'package:advanceproje/core/theme/theme_manager.dart';
import 'package:advanceproje/core/translation/translation_manager.dart';
import 'package:advanceproje/view/screen/cart_screen.dart';
import 'package:advanceproje/view/screen/details_screen.dart';
import 'package:advanceproje/view/screen/getPages_screen.dart';
import 'package:advanceproje/view/screen/homePage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MainProje extends StatelessWidget {
  MainProje._internal();
  static final MainProje _instance = MainProje._internal();
  factory MainProje() => _instance;
  GetPagesControllerImp getPagesControllerImp =
      Get.put(GetPagesControllerImp());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.lightTheme,
      translations: TranslationManager(),
      locale: const Locale('en'),
      home: getPagesScreen(),
    );
  }
}
