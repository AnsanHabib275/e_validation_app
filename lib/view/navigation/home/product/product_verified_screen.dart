import 'dart:async';

import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/navigation/home/product/fake_product_screen.dart';
import 'package:e_validation/view/navigation/home/product/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../models/navigation/scanProduct/scan_product_model.dart';
import '../../../../res/assets/font_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../view_models/controller/navigation/navigation_view_model.dart';

class ProductVerifiedScreen extends StatefulWidget {
  const ProductVerifiedScreen({super.key});

  @override
  State<ProductVerifiedScreen> createState() => _ProductVerifiedScreenState();
}

class _ProductVerifiedScreenState extends State<ProductVerifiedScreen> {
  final navigationVM = Get.find<NavigationViewModel>();
  @override
  void initState() {
    super.initState();
    final args = navigationVM.screenArguments as Map<String, dynamic>? ?? {};
    final productImage = args['productImage'] ?? '';
    final scanCount = args['scanCount'] ?? '';
    final productName = args['productName'] ?? '';
    final barcode = args['barcode'] ?? '';
    final productSKU = args['productSKU'] ?? '';
    final supplier = args['supplier'] ?? '';
    final createdAt = args['createdAt'] ?? '';
    final expiryDate = args['expiryDate'] ?? '';
    Timer(
        const Duration(milliseconds: 900),
        () => navigationVM.changeScreen(
              ProductDetailScreen(),
              arguments: {
                'productImage': productImage,
                'scanCount': scanCount,
                'productName': productName,
                'barcode': barcode,
                'productSKU': productSKU,
                'supplier': supplier,
                'createdAt': createdAt,
                'expiryDate': expiryDate,
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                  right: Get.width * Utils.getResponsiveWidth(10),
                  top: Get.height * Utils.getResponsiveHeight(30),
                  child: Image.asset(IconAssets.ic_close)),
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
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(36),
                        ),
                        Text(
                          'product_verified'.tr,
                          style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: Get.height * Utils.getResponsiveSize(30),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
