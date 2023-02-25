import 'package:advanceproje/core/constant/category_manager.dart';
import 'package:advanceproje/core/constant/color_manager.dart';
import 'package:advanceproje/core/constant/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryListWidget extends StatefulWidget {
  int cateIndex = 0;

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      // width: 400,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) =>
            Padding(padding: EdgeInsets.all(5)),
        scrollDirection: Axis.horizontal,
        itemCount: CategoryManager.allCategory.length,
        itemBuilder: (context, index) {
          return InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onTap: () {
              setState(() {});
              widget.cateIndex = index;
              print(widget.cateIndex);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: widget.cateIndex == index
                    ? ColorManager.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: ColorManager.silver.withOpacity(.4),
                ),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    CategoryManager.allCategory[index]['category_image'],
                    width: 35,
                    height: 35,
                    color: widget.cateIndex == index
                        ? Colors.white
                        : ColorManager.primary,
                  ),
                  SizedBox(width: 5),
                  Text(
                    CategoryManager.allCategory[index]['category_name'],
                    style: FontManager.mediumStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: widget.cateIndex == index
                          ? Colors.white
                          : ColorManager.primary,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
