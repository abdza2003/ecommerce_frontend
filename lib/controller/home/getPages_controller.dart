import 'package:advanceproje/core/constant/image_manager.dart';
import 'package:advanceproje/view/screen/homePage_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GetPagesController extends GetxController {
  changePageIndex(int selectPageIndex);
}

class GetPagesControllerImp extends GetPagesController {
  late int pageIndex;
  List getPagesInfo = [
    {
      'page_name': 'home page',
      'child': HomePageScreen(),
      'icon': ImageManager.iconHome,
      'selected_icon': ImageManager.iconHomeBold,
    },
    {
      'page_name': 'Favorite',
      'child': Center(child: Text('Favorite page')),
      'icon': ImageManager.iconFavorite,
      'selected_icon': ImageManager.iconFavoriteBold,
    },
    {
      'page_name': 'Profile',
      'child': Center(child: Text('Profile page')),
      'icon': ImageManager.iconProfile,
      'selected_icon': ImageManager.iconProfileBold,
    },
  ];

  changePageIndex(int selectPageIndex) {
    pageIndex = selectPageIndex;
    update();
  }

  @override
  void onInit() {
    pageIndex = 0;
    super.onInit();
  }
}
