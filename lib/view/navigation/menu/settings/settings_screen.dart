import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view_models/controller/changePassword/change_password_view_model.dart';
import 'package:e_validation/view_models/controller/navigation/navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final changePasswordVM = Get.put(ChangePasswordViewModel());
  final navigationVM = Get.put(NavigationViewModel());
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: Get.width * Utils.getResponsiveWidth(428),
              height: Get.height * Utils.getResponsiveHeight(461),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.product_detail_bg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: Get.height * Utils.getResponsiveHeight(136)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.img_settings,
                      height: Get.height * Utils.getResponsiveHeight(216),
                      width: Get.width * Utils.getResponsiveWidth(262),
                    ),
                    SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16)),
                    Text(
                      'settings'.tr,
                      style: TextStyle(
                          color: AppColor.textColorPrimary,
                          fontSize: Get.height * Utils.getResponsiveSize(26),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(16),
                vertical: Get.height * Utils.getResponsiveHeight(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.changePasswordScreen);
                      },
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.all(
                              Get.height * Utils.getResponsiveHeight(14)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(IconAssets.ic_change_password),
                              SizedBox(
                                width: Get.width * Utils.getResponsiveWidth(16),
                              ),
                              Expanded(
                                child: Text(
                                  'change_password'.tr,
                                  style: TextStyle(
                                      color: AppColor.textGreyPrimary,
                                      fontSize: Get.height *
                                          Utils.getResponsiveSize(13),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Image.asset(
                                IconAssets.ic_submitted_complaint,
                                height:
                                    Get.height * Utils.getResponsiveHeight(15),
                                width: Get.width * Utils.getResponsiveWidth(15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(2),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.updateProfileScreen);
                      },
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.all(
                            Get.height * Utils.getResponsiveHeight(14),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(IconAssets.ic_update_profile),
                              SizedBox(
                                width: Get.width * Utils.getResponsiveWidth(16),
                              ),
                              Expanded(
                                child: Text(
                                  'update_profile'.tr,
                                  style: TextStyle(
                                      color: AppColor.textGreyPrimary,
                                      fontSize: Get.height *
                                          Utils.getResponsiveHeight(13),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Image.asset(
                                IconAssets.ic_submitted_complaint,
                                height:
                                    Get.height * Utils.getResponsiveHeight(15),
                                width: Get.width * Utils.getResponsiveWidth(15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
