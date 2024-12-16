import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../res/assets/font_assets.dart';
import '../../../../res/colors/app_color.dart';

class ProductVerifiedScreen extends StatefulWidget {
  const ProductVerifiedScreen({super.key});

  @override
  State<ProductVerifiedScreen> createState() => _ProductVerifiedScreenState();
}

class _ProductVerifiedScreenState extends State<ProductVerifiedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                right: 20, top: 20, child: Image.asset(IconAssets.ic_close)),
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(ImageAssets.account_created_logo),
                      Text(
                        'product_verified'.tr,
                        style: const TextStyle(
                          color: AppColor.textColorPrimary,
                          fontSize: 30,
                          fontFamily: FontAssets.poppins_semi_bold,
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
