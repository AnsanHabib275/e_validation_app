import 'package:e_validation/view/splash/widget/login_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Container(
          height: Get.height * 1,
          width: Get.width * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.splash_bg),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(30)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'welcome'.tr,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: Get.height * Utils.getResponsiveSize(51),
                        color: AppColor.textColorPrimary),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(ImageAssets.splash_screen_logo),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(23),
                      ),
                      Text(
                        'app_title'.tr,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: Get.height * Utils.getResponsiveSize(30),
                            color: AppColor.textBlackPrimary),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(5),
                      ),
                      Text(
                        'where_fraud_fails'.tr,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: Get.height * Utils.getResponsiveSize(20),
                            color: AppColor.textLightGreyPrimary),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LoginButtonWidget(),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'don’t_have_an_account_yet'.tr,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(19),
                                color: AppColor.textBlackPrimary),
                          ),
                          SizedBox(
                            width: Get.width * Utils.getResponsiveWidth(5),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(RoutesName.signUpScreen);
                            },
                            child: Text(
                              'signup'.tr,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(19),
                                  color: AppColor.underlineTextColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
