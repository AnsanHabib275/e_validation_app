import 'package:e_validation/res/assets/gif_assets.dart';
import 'package:e_validation/view/navigation/home/product/widget/complain_button_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/leave_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../view_models/controller/navigation/navigation_view_model.dart';

class FakeProductScreen extends StatefulWidget {
  const FakeProductScreen({super.key});
  @override
  State<FakeProductScreen> createState() => _FakeProductScreenState();
}

class _FakeProductScreenState extends State<FakeProductScreen> {
  @override
  Widget build(BuildContext context) {
    final navVM = Get.find<NavigationViewModel>();
    final args = navVM.screenArguments as Map<String, dynamic>? ?? {};
    final code = args['code'] ?? '';
    final productId = args['productId'] ?? '';
    final scanCount = args['scanCount'] ?? '';
    final message = args['message'] ?? '';
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * Utils.getResponsiveWidth(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: Get.height * Utils.getResponsiveHeight(81),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    color: AppColor.transparent,
                    GifAssets.gif_fake_product,
                    colorBlendMode: BlendMode.softLight,
                    height: Get.height * Utils.getResponsiveHeight(300),
                    width: Get.width * Utils.getResponsiveWidth(300),
                  ),
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    Get.height * Utils.getResponsiveHeight(29),
                              ),
                              Text(
                                'fake_product'.tr,
                                style: TextStyle(
                                    color: AppColor.textColorPrimary,
                                    fontSize: Get.height *
                                        Utils.getResponsiveSize(22),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height:
                                    Get.height * Utils.getResponsiveHeight(8),
                              ),
                              Card(
                                elevation: 1,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width *
                                          Utils.getResponsiveWidth(10),
                                      vertical: Get.height *
                                          Utils.getResponsiveHeight(12)),
                                  child: Row(
                                    children: [
                                      Text(
                                        'product_scanned'.tr,
                                        style: TextStyle(
                                            color:
                                                AppColor.textLightGreyPrimary,
                                            fontSize: Get.height *
                                                Utils.getResponsiveSize(16),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Spacer(),
                                      Text(
                                        scanCount,
                                        style: TextStyle(
                                            color: AppColor.textRedPrimary,
                                            fontSize: Get.height *
                                                Utils.getResponsiveSize(16),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    Get.height * Utils.getResponsiveHeight(10),
                              ),
                              Card(
                                elevation: 1,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.width *
                                            Utils.getResponsiveWidth(10),
                                        vertical: Get.height *
                                            Utils.getResponsiveHeight(12)),
                                    child: Text(
                                      message,
                                      // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                      style: TextStyle(
                                          color: AppColor.textLightGreyPrimary,
                                          fontSize: Get.height *
                                              Utils.getResponsiveSize(16),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    Get.height * Utils.getResponsiveHeight(20),
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(child: LeaveButtonWidget()),
                                  SizedBox(
                                    width: Get.width *
                                        Utils.getResponsiveWidth(12),
                                  ),
                                  Expanded(
                                      child: ComplainButtonWidget(
                                    code: code,
                                    productId: productId,
                                    scanCount: scanCount,
                                    message: message,
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).padding.bottom,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
