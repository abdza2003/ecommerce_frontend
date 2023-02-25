import 'package:advanceproje/core/constant/color_manager.dart';
import 'package:advanceproje/core/constant/font_manager.dart';
import 'package:advanceproje/core/constant/image_manager.dart';
import 'package:advanceproje/core/constant/mediaquery_manager.dart';
import 'package:advanceproje/core/constant/product_manager.dart';
import 'package:advanceproje/core/function/hex_color.dart';
import 'package:advanceproje/core/function/network_image.dart';
import 'package:advanceproje/view/screen/cart_screen.dart';
import 'package:advanceproje/view/widget/home/countItems_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  int productIndex;
  DetailsScreen({required this.productIndex});
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool readOnly = false;
  List size = ['S', 'M', 'L', 'XL'];
  List color = [
    ColorManager.primary,
    ColorManager.primaryGradation1,
    ColorManager.silver,
  ];
  int selectSize = 0;
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
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Hero(
                        tag: widget.productIndex,
                        child: GetnetworkImage(
                          imageUri: ProductManager
                              .allProduct[widget.productIndex]['product_image'],
                          imageSize: MediQueryManager(context).height / 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  ProductManager.allProduct[widget.productIndex]
                                          ['product_favorite'] =
                                      (ProductManager.allProduct[
                                                      widget.productIndex]
                                                  ['product_favorite'] ==
                                              0)
                                          ? 1
                                          : 0;
                                });
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.black,
                                child: SvgPicture.asset(
                                  ProductManager.allProduct[widget.productIndex]
                                              ['product_favorite'] ==
                                          0
                                      ? ImageManager.iconFavorite
                                      : ImageManager.iconFavoriteBold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CountItemsWidget(
                      productTitle: ProductManager
                          .allProduct[widget.productIndex]['product_title']),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // color: Colors.red,
                        child: RatingStars(
                          value: double.parse(ProductManager
                              .allProduct[widget.productIndex]['product_star']),
                          starColor: HexColor('#FFD33C'),
                          starCount: 5,
                          valueLabelVisibility: false,
                          starSpacing: 3,
                          starSize: 25,
                          starOffColor: ColorManager.silver.withOpacity(.4),
                          // starOffColor: ,
                          starBuilder: (index, color) => Icon(
                            Icons.star,
                            color: color,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        '${ProductManager.allProduct[widget.productIndex]['product_star']}.0',
                        style: FontManager.mediumStyle.copyWith(
                          color: ColorManager.silver,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.only(right: 40),
                    // color: Colors.red,
                    height: readOnly
                        ? MediQueryManager(context).height / 13
                        : MediQueryManager(context).height / 20,
                    child: Text(
                      '${(ProductManager.allProduct[widget.productIndex]['product_desc'] as String).substring(0, readOnly ? (ProductManager.allProduct[widget.productIndex]['product_desc'] as String).length : 60)} ',
                      style: FontManager.mediumStyle.copyWith(
                        color: HexColor('#878787'),
                      ),
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          readOnly = !readOnly;
                          print('$readOnly');
                        });
                      },
                    text: readOnly ? 'Back' : 'Read Only ...',
                    style: FontManager.semiBoldStyle.copyWith(
                      fontSize: 20,
                    ),
                  )),
                  SizedBox(height: 15),
                  Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 350,
                      child: Divider(
                        color: HexColor('#878787').withOpacity(.6),
                        thickness: 1.2,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Choose Size',
                            style: FontManager.semiBoldStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: List.generate(
                              4,
                              (index) => InkWell(
                                customBorder: CircleBorder(),
                                onTap: () {
                                  setState(() {
                                    selectSize = index;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  height: MediQueryManager(context).height / 20,
                                  width: MediQueryManager(context).height / 25,
                                  decoration: BoxDecoration(
                                      color: selectSize == index
                                          ? ColorManager.primaryGradation1
                                          : ColorManager.silver.withOpacity(.2),
                                      shape: BoxShape.circle),
                                  child: Text(
                                    '${size[index]}',
                                    style: TextStyle(
                                      color: selectSize == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: selectSize == index
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Color',
                            style: FontManager.semiBoldStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: List.generate(
                              color.length,
                              (index) => Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                height: MediQueryManager(context).height / 20,
                                width: MediQueryManager(context).height / 25,
                                decoration: BoxDecoration(
                                  color: color[index],
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediQueryManager(context).height / 5,
                      )
                    ],
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => CartScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ImageManager.iconCard,
                        color: Colors.white,
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Add To Card | \$${ProductManager.allProduct[1]['product_price']}',
                        style: FontManager.semiBoldStyle.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        // color: Colors.red,
                        height: 30,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          '\$190',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
