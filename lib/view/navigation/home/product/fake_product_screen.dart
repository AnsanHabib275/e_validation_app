import 'package:e_validation/res/assets/gif_assets.dart';
import 'package:e_validation/view/navigation/home/product/widget/complain_button_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/leave_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

class FakeProductScreen extends StatefulWidget {
  const FakeProductScreen({super.key});

  @override
  State<FakeProductScreen> createState() => _FakeProductScreenState();
}

class _FakeProductScreenState extends State<FakeProductScreen> {
  @override
  Widget build(BuildContext context) {
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
                    GifAssets.gif_fake_product,
                    colorBlendMode: BlendMode.softLight,
                    height: Get.height * Utils.getResponsiveHeight(300),
                    width: Get.width * Utils.getResponsiveWidth(300),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(29),
                      ),
                      Text(
                        'fake_product'.tr,
                        style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: Get.height * Utils.getResponsiveSize(22),
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
                          child: Row(
                            children: [
                              Text(
                                'product_scanned'.tr,
                                style: TextStyle(
                                    color: AppColor.textLightGreyPrimary,
                                    fontSize: Get.height *
                                        Utils.getResponsiveSize(16),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              Text(
                                '5',
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
                        height: Get.height * Utils.getResponsiveHeight(10),
                      ),
                      Card(
                        elevation: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  Get.width * Utils.getResponsiveWidth(10),
                              vertical:
                                  Get.height * Utils.getResponsiveHeight(12)),
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                            style: TextStyle(
                                color: AppColor.textLightGreyPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(106),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: LeaveButtonWidget()),
                          SizedBox(
                            width: Get.width * Utils.getResponsiveWidth(12),
                          ),
                          Expanded(child: ComplainButtonWidget()),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(150),
                      ),
                    ],
                  ),
                ),
              )

              // LeaveButtonWidget(),
              // ComplainButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
