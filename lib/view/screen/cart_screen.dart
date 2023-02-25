import 'package:advanceproje/core/constant/color_manager.dart';
import 'package:advanceproje/core/constant/font_manager.dart';
import 'package:advanceproje/core/constant/image_manager.dart';
import 'package:advanceproje/core/constant/mediaquery_manager.dart';
import 'package:advanceproje/core/constant/product_manager.dart';
import 'package:advanceproje/core/function/hex_color.dart';
import 'package:advanceproje/core/function/network_image.dart';
import 'package:advanceproje/view/widget/home/cartProduct_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ListView(
                physics: BouncingScrollPhysics(),
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        customBorder: CircleBorder(),
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: ColorManager.silver.withOpacity(.1),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorManager.silver,
                                width: 1.4,
                              )),
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        'Checkout',
                        style: FontManager.semiBoldStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      InkWell(
                        customBorder: CircleBorder(),
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: ColorManager.silver.withOpacity(.1),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorManager.silver,
                              )),
                          child: SvgPicture.asset(
                            'assets/images/else/menu.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CarProductWidget(productIndex: 1, count: '3'),
                  CarProductWidget(productIndex: 6),
                  CarProductWidget(productIndex: 7, count: '4'),
                  SizedBox(height: 10),
                  Text(
                    'Shipping Information',
                    style: FontManager.semiBoldStyle.copyWith(fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 500,
                      height: MediQueryManager(context).height / 12,
                      decoration: BoxDecoration(
                        color: HexColor('#F6F6F6'),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(
                            ImageManager.iconViza,
                            width: 80,
                            height: 80,
                          ),
                          Text(
                            '**** **** **** 2143',
                            style: FontManager.mediumStyle
                                .copyWith(color: Colors.black54),
                          ),
                          // SizedBox(width: 50),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total (9 items)',
                        style: FontManager.semiBoldStyle.copyWith(fontSize: 18),
                      ),
                      Text(
                        '\$130.0',
                        style: FontManager.semiBoldStyle.copyWith(fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(500, 0),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Pay',
                    style: FontManager.boldStyle.copyWith(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
