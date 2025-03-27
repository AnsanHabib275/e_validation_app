import 'package:e_validation/models/login/login_model.dart';
import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/urls/app_url.dart';
import 'package:e_validation/view/navigation/home/product/widget/done_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../res/assets/font_assets.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../view_models/controller/user_preference/user_preference_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userVM = Get.find<UserPreference>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: Get.width * Utils.getResponsiveWidth(428),
              height: Get.height * Utils.getResponsiveHeight(365),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets
                      .product_detail_bg), // Replace with your image path
                  fit: BoxFit.cover, // Adjust the image to fill the screen
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: Get.height * Utils.getResponsiveHeight(98)),
                    child: CircleAvatar(
                      radius: Get.height * Utils.getResponsiveSize(73),
                      backgroundColor: AppColor.lightGreyColor,
                      // backgroundImage: AssetImage(ImageAssets.dummy_profile),
                      child: userVM.user_ImageURL.isEmpty
                          ? SvgPicture.asset(
                              ImageAssets
                                  .img_profile, // Your default SVG image path
                              fit: BoxFit.cover,
                            )
                          : ClipOval(
                              child: Image.network(
                                AppUrl.baseUrl + userVM.user_ImageURL.value,
                                fit: BoxFit.cover,
                                height:
                                    Get.height * Utils.getResponsiveHeight(146),
                                width:
                                    Get.width * Utils.getResponsiveWidth(146),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(30),
                  ),
                  Text(
                    userVM.user_name.value,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: AppColor.textColorPrimary,
                        fontSize: Get.height * Utils.getResponsiveSize(20),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    userVM.user_email.value,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: AppColor.textGreyPrimary,
                        fontSize: Get.height * Utils.getResponsiveSize(16),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * Utils.getResponsiveWidth(16),
                  vertical: Get.height * Utils.getResponsiveHeight(20)),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(
                      Get.height * Utils.getResponsiveHeight(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'username'.tr,
                            style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(20),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(5),
                          ),
                          Text(
                            userVM.user_name.value,
                            style: TextStyle(
                                color: AppColor.textGreyPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(12),
                          ),
                          Text(
                            'phone_number'.tr,
                            style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(20),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(5),
                          ),
                          Text(
                            '${userVM.user_CountryCode.value}${userVM.user_mobileNumber.value}',
                            style: TextStyle(
                                color: AppColor.textGreyPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(12),
                          ),
                          Text(
                            'email'.tr,
                            style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(20),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(5),
                          ),
                          Text(
                            userVM.user_email.value,
                            style: TextStyle(
                                color: AppColor.textGreyPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(12),
                          ),
                          Text(
                            'date_of_birth'.tr,
                            style: TextStyle(
                                color: AppColor.textColorPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(20),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(5),
                          ),
                          Text(
                            Utils.appFormatDate(userVM.user_dob.value),
                            style: TextStyle(
                                color: AppColor.textGreyPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Spacer(),
                      SvgPicture.asset(IconAssets.ic_edit)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
