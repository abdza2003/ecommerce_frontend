import 'package:advanceproje/core/constant/color_manager.dart';
import 'package:advanceproje/core/constant/font_manager.dart';
import 'package:advanceproje/core/constant/product_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CountItemsWidget extends StatelessWidget {
  String productTitle;
  CountItemsWidget({required this.productTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${productTitle}',
          style: FontManager.semiBoldStyle,
        ),
        Row(
          children: [
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onTap: () {},
              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12, width: 1.2),
                  color: ColorManager.silver.withOpacity(.001),
                ),
                child: const Icon(
                  Icons.remove,
                  size: 30,
                ),
              ),
            ),
            SizedBox(width: 15),
            Text(
              '1',
              style: FontManager.boldStyle.copyWith(
                fontSize: 22,
              ),
            ),
            SizedBox(width: 15),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              onTap: () {},
              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12, width: 1.2),
                  color: ColorManager.silver.withOpacity(.001),
                ),
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
