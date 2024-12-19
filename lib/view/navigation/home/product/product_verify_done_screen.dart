import 'package:e_validation/res/assets/gif_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view/navigation/home/product/widget/done_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductVerifyDoneScreen extends StatefulWidget {
  const ProductVerifyDoneScreen({super.key});

  @override
  State<ProductVerifyDoneScreen> createState() =>
      _ProductVerifyDoneScreenState();
}

class _ProductVerifyDoneScreenState extends State<ProductVerifyDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            GifAssets.gif_done,
            height: Get.height * Utils.getResponsiveHeight(300),
            width: Get.width * Utils.getResponsiveWidth(300),
          ),
          SizedBox(
            height: Get.height * Utils.getResponsiveHeight(102),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: DoneButtonWidget(),
          ),
        ],
      )),
    );
  }
}
