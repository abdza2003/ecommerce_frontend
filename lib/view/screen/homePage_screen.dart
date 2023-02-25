import 'package:advanceproje/core/constant/category_manager.dart';
import 'package:advanceproje/core/constant/color_manager.dart';
import 'package:advanceproje/core/constant/font_manager.dart';
import 'package:advanceproje/core/constant/image_manager.dart';
import 'package:advanceproje/core/constant/mediaQuery_manager.dart';
import 'package:advanceproje/core/constant/product_manager.dart';
import 'package:advanceproje/core/function/network_image.dart';
import 'package:advanceproje/view/widget/home/appbar_widget.dart';
import 'package:advanceproje/view/widget/home/categoryList_widget.dart';
import 'package:advanceproje/view/widget/home/filtreButton_widget.dart';
import 'package:advanceproje/view/widget/home/product_widget.dart';
import 'package:advanceproje/view/widget/home/searchText_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  // const HomePageScreen({super.key});
  int cateIndex = 0;
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                AppbarWidget(userName: 'abdza2003'),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SearchTextWidget(),
                    const SizedBox(width: 10),
                    FiltreButtonWidget(),
                  ],
                ),
                const SizedBox(height: 20),
                CategoryListWidget(),
                const SizedBox(height: 20),
                const ProductWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
