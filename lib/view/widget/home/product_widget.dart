import 'package:advanceproje/core/constant/color_manager.dart';
import 'package:advanceproje/core/constant/font_manager.dart';
import 'package:advanceproje/core/constant/image_manager.dart';
import 'package:advanceproje/core/constant/mediaquery_manager.dart';
import 'package:advanceproje/core/constant/product_manager.dart';
import 'package:advanceproje/core/function/network_image.dart';
import 'package:advanceproje/view/screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediQueryManager(context).height / 1.75,
      child: MasonryGridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          // padding: EdgeInsets.all(20),
          crossAxisCount: 2,
          itemCount: ProductManager.allProduct.length,
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.topRight,
              children: [
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Get.to(() => DetailsScreen(productIndex: index));
                  },
                  child: Container(
                    // margin: EdgeInsets.all(10),
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: index,
                          child: GetnetworkImage(
                            imageUri: ProductManager.allProduct[index]
                                ['product_image'],
                          ),
                        ),

                        SizedBox(height: 10),
                        Text(
                          ProductManager.allProduct[index]['product_title'],
                          style:
                              FontManager.semiBoldStyle.copyWith(fontSize: 17),
                        ),
                        // SizedBox(height: 5),
                        Text(
                          ProductManager.allProduct[index]['categor_name'],
                          style: FontManager.mediumStyle.copyWith(
                            fontSize: 17,
                            color: ColorManager.silver,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${ProductManager.allProduct[index]['product_price']}',
                              style: FontManager.semiBoldStyle
                                  .copyWith(fontSize: 20),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  const Icon(
                                    FontAwesome.star,
                                    color: Colors.orange,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${ProductManager.allProduct[index]['product_star']}',
                                    style: FontManager.semiBoldStyle
                                        .copyWith(fontSize: 17),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-15, 15),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        ProductManager.allProduct[index]['product_favorite'] =
                            (ProductManager.allProduct[index]
                                        ['product_favorite'] ==
                                    0)
                                ? 1
                                : 0;
                      });
                      print('object');
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: ColorManager.primaryGradation1,
                      child: SvgPicture.asset(
                        ProductManager.allProduct[index]['product_favorite'] ==
                                0
                            ? ImageManager.iconFavorite
                            : ImageManager.iconFavoriteBold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
