import 'package:e_validation/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../utils/utils.dart';

class AccountCreatedScreen extends StatefulWidget {
  const AccountCreatedScreen({super.key});

  @override
  State<AccountCreatedScreen> createState() => _AccountCreatedScreenState();
}

class _AccountCreatedScreenState extends State<AccountCreatedScreen> {
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
              image: AssetImage(
                  ImageAssets.splash_bg), // Replace with your image path
              fit: BoxFit.cover, // Adjust the image to fill the screen
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(ImageAssets.account_created_logo),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(36),
                ),
                Text(
                  'your_account_has_been_created'.tr,
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: AppColor.textGreyPrimary,
                    fontSize: Get.height * Utils.getResponsiveSize(20),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(6),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'you_can_now'.tr,
                      textScaleFactor: 1,
                      style: TextStyle(
                        color: AppColor.textGreyPrimary,
                        fontSize: Get.height * Utils.getResponsiveSize(19),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * Utils.getResponsiveWidth(6),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.loginScreen);
                      },
                      child: Text(
                        'login'.tr.toUpperCase(),
                        textScaleFactor: 1,
                        style: TextStyle(
                          color: AppColor.textColorPrimary,
                          fontSize: Get.height * Utils.getResponsiveSize(19),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
