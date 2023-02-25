import 'package:advanceproje/core/constant/color_manager.dart';
import 'package:advanceproje/core/constant/font_manager.dart';
import 'package:advanceproje/core/constant/mediaquery_manager.dart';
import 'package:advanceproje/core/constant/product_manager.dart';
import 'package:advanceproje/core/function/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class CarProductWidget extends StatelessWidget {
  int productIndex;
  String? count;
  CarProductWidget({required this.productIndex, this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetnetworkImage(
              imageUri: ProductManager.allProduct[productIndex]
                  ['product_image'],
              imageSize: 100.0,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.red,
                    width: MediQueryManager(context).height / 6.5,
                    child: Text(
                      '${ProductManager.allProduct[productIndex]['product_title']}',
                      style: FontManager.semiBoldStyle.copyWith(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${ProductManager.allProduct[productIndex]['categor_name']}',
                    style: FontManager.mediumStyle.copyWith(
                      fontSize: 17,
                      color: ColorManager.silver,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '\$${ProductManager.allProduct[productIndex]['product_price']}',
                    style: FontManager.semiBoldStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    FontAwesome.ellipsis,
                    size: 20,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        minimumSize: Size(100, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text('-',
                            style: FontManager.mediumStyle.copyWith(
                              color: Colors.white,
                              fontSize: 25,
                            )),
                        SizedBox(width: 15),
                        Text(
                          count ?? '2',
                          style: FontManager.mediumStyle.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 15),
                        Text('+',
                            style: FontManager.mediumStyle.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 400,
          child: Divider(
            color: ColorManager.primaryGradation1.withOpacity(.3),
            thickness: 1.2,
          ),
        ),
      ],
    );
  }
}
