import 'package:e_validation/res/assets/gif_assets.dart';
import 'package:e_validation/view/navigation/home/product/widget/complain_button_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/leave_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../res/assets/font_assets.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

class FakeProductScreen extends StatefulWidget {
  const FakeProductScreen({super.key});

  @override
  State<FakeProductScreen> createState() => _FakeProductScreenState();
}

class _FakeProductScreenState extends State<FakeProductScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
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

              Text(
                'fake_product'.tr,
                style: TextStyle(
                    color: AppColor.textColorPrimary,
                    fontSize: 22,
                    fontFamily: FontAssets.poppins_semi_bold),
              ),
              SizedBox(
                height: Get.height * Utils.getResponsiveHeight(8),
              ),
              Card(
                elevation: 0.1,
                color: AppColor.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        'product_scanned'.tr,
                        style: TextStyle(
                            color: AppColor.textBlackPrimary,
                            fontSize: 16,
                            fontFamily: FontAssets.poppins_regular),
                      ),
                      Spacer(),
                      Text(
                        '5',
                        style: TextStyle(
                            color: AppColor.textRedPrimary,
                            fontSize: 16,
                            fontFamily: FontAssets.poppins_regular),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0.1,
                color: AppColor.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                    style: TextStyle(
                        color: AppColor.textBlackPrimary,
                        fontSize: 16,
                        fontFamily: FontAssets.poppins_regular),
                  ),
                ),
              ),
              // Spacer(),
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
              // LeaveButtonWidget(),
              // ComplainButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
