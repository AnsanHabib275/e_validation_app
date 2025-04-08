import 'package:e_validation/view/navigation/home/product/fake_product_screen.dart';
import 'package:e_validation/view/navigation/home/product/product_verify_done_screen.dart';
import 'package:e_validation/view/navigation/home/product/widget/done_button_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/product_verify_done_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/navigation/scanProduct/scan_product_model.dart';
import '../../../../res/assets/font_assets.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../view_models/controller/navigation/navigation_view_model.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late final Map<String, dynamic> args;

  @override
  void initState() {
    super.initState();
    final navigationVM = Get.find<NavigationViewModel>();
    args = navigationVM.screenArguments as Map<String, dynamic>? ?? {};
  }

  @override
  Widget build(BuildContext context) {
    final productImage = args['productImage'] ?? '';
    final scanCount = args['scanCount'] ?? '';
    final productName = args['productName'] ?? '';
    final barcode = args['barcode'] ?? '';
    final productSKU = args['productSKU'] ?? '';
    final supplier = args['supplier'] ?? '';
    final createdAt = args['createdAt'] ?? '';
    final expiryDate = args['expiryDate'] ?? '';
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: Get.width * Utils.getResponsiveWidth(428),
              height: Get.height * Utils.getResponsiveHeight(408),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets
                      .product_detail_bg), // Replace with your image path
                  fit: BoxFit.cover, // Adjust the image to fill the screen
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: Get.height * Utils.getResponsiveHeight(107)),
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      // navigationVM.changeScreen(FakeProductScreen());
                    },
                    child: Image.asset(
                      ImageAssets.product_with_qr_code,
                      fit: BoxFit.contain,
                      height: Get.height * Utils.getResponsiveHeight(254),
                      width: Get.width * Utils.getResponsiveWidth(93),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: Get.width * Utils.getResponsiveWidth(20),
                  right: Get.width * Utils.getResponsiveWidth(20),
                  bottom: kBottomNavigationBarHeight,
                ),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(22),
                        ),
                        Text(
                          'product_details'.tr,
                          style: TextStyle(
                              color: AppColor.textColorPrimary,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(22),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        Card(
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    Get.width * Utils.getResponsiveWidth(10),
                                vertical:
                                    Get.height * Utils.getResponsiveHeight(12)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'product_name'.tr,
                                      style: TextStyle(
                                          color: AppColor.textLightGreyPrimary,
                                          fontSize: Get.height *
                                              Utils.getResponsiveSize(16),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Text(
                                      productName,
                                      style: TextStyle(
                                          color: AppColor.textLightGreyPrimary,
                                          fontSize: Get.height *
                                              Utils.getResponsiveSize(16),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height *
                                      Utils.getResponsiveHeight(10),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'barcode'.tr,
                                      style: TextStyle(
                                          color: AppColor.textLightGreyPrimary,
                                          fontSize: Get.height *
                                              Utils.getResponsiveSize(16),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Expanded(
                                      child: Text(
                                        barcode,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color:
                                                AppColor.textLightGreyPrimary,
                                            fontSize: Get.height *
                                                Utils.getResponsiveSize(16),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height *
                                      Utils.getResponsiveHeight(10),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'product_sku'.tr,
                                      style: TextStyle(
                                          color: AppColor.textLightGreyPrimary,
                                          fontSize: Get.height *
                                              Utils.getResponsiveSize(16),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Text(
                                      productSKU,
                                      style: TextStyle(
                                          color: AppColor.textLightGreyPrimary,
                                          fontSize: Get.height *
                                              Utils.getResponsiveSize(16),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height *
                                      Utils.getResponsiveHeight(10),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'supplier'.tr,
                                      style: TextStyle(
                                          color: AppColor.textLightGreyPrimary,
                                          fontSize: Get.height *
                                              Utils.getResponsiveSize(16),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Text(
                                      supplier,
                                      style: TextStyle(
                                          color: AppColor.textLightGreyPrimary,
                                          fontSize: Get.height *
                                              Utils.getResponsiveSize(16),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height *
                                      Utils.getResponsiveHeight(10),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'created_at'.tr,
                                      style: TextStyle(
                                          color: AppColor.textLightGreyPrimary,
                                          fontSize: Get.height *
                                              Utils.getResponsiveSize(16),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Text(
                                      Utils.appFormatDate(createdAt),
                                      style: TextStyle(
                                          color: AppColor.textLightGreyPrimary,
                                          fontSize: Get.height *
                                              Utils.getResponsiveSize(16),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height *
                                      Utils.getResponsiveHeight(10),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'expiry_date'.tr,
                                      style: TextStyle(
                                          color: AppColor.textLightGreyPrimary,
                                          fontSize: Get.height *
                                              Utils.getResponsiveSize(16),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Text(
                                      Utils.appFormatDate(expiryDate),
                                      style: TextStyle(
                                          color: AppColor.textLightGreyPrimary,
                                          fontSize: Get.height *
                                              Utils.getResponsiveSize(16),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(63),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  Get.width * Utils.getResponsiveWidth(10)),
                          child: ProductVerifyDoneButtonWidget(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom,
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
