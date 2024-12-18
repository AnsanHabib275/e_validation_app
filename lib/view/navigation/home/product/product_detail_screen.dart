import 'package:e_validation/view/navigation/home/product/widget/done_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/assets/font_assets.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: Get.width * Utils.getResponsiveWidth(428),
              height: Get.height * Utils.getResponsiveHeight(300),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets
                      .product_detail_bg), // Replace with your image path
                  fit: BoxFit.cover, // Adjust the image to fill the screen
                ),
              ),
              child: Image.asset(
                ImageAssets.product_with_qr_code,
                height: Get.height * Utils.getResponsiveHeight(254),
                width: Get.width * Utils.getResponsiveWidth(93),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(children: [
                Text(
                  'product_details'.tr,
                  style: TextStyle(
                      color: AppColor.textColorPrimary,
                      fontSize: 22,
                      fontFamily: FontAssets.poppins_semi_bold),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DoneButtonWidget(),
            )
          ],
        ),
      ),
    );
  }
}
