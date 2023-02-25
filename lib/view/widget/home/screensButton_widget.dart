import 'package:advanceproje/controller/home/getPages_controller.dart';
import 'package:advanceproje/core/constant/color_manager.dart';
import 'package:advanceproje/core/constant/image_manager.dart';
import 'package:advanceproje/view/screen/homePage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ScreensButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetPagesControllerImp>(builder: (controller) {
      return Card(
        elevation: 10,
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: ColorManager.primaryGradation2,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  controller.getPagesInfo.length,
                  (index) => GestureDetector(
                    onTap: () {
                      controller.changePageIndex(index);
                      print('${controller.pageIndex}');
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: controller.pageIndex == index
                          ? ColorManager.silver.withOpacity(.2)
                          : Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            controller.pageIndex == index
                                ? controller.getPagesInfo[index]
                                    ['selected_icon']
                                : controller.getPagesInfo[index]['icon'],
                            color: Colors.white,
                            width: 30,
                            height: 30,
                          ),
                          AnimatedContainer(
                            alignment: Alignment.center,
                            duration: const Duration(milliseconds: 150),
                            width: controller.pageIndex == index ? 20 : 0,
                            height: controller.pageIndex == index ? 5 : 0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
      );
    });
  }
}
