import 'package:e_validation/view/reset_password/widget/input_confirm_password_widget.dart';
import 'package:e_validation/view/reset_password/widget/input_new_password_widget.dart';
import 'package:e_validation/view/reset_password/widget/reset_password_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../res/assets/font_assets.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../utils/utils.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formkey = GlobalKey<FormState>();
  // final e_id = Get.arguments['e_id'];
  final e_id = '';

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(Get.height * Utils.getResponsiveHeight(124)),
              child: Stack(
                children: [
                  Positioned(
                    top: Get.height * Utils.getResponsiveHeight(60),
                    left: 0,
                    right: 0,
                    child: Divider(
                      height: Get.height * Utils.getResponsiveHeight(1),
                      thickness: 1,
                      color: AppColor.textBlack10Per, // Customize divider color
                    ),
                  ),
                  Positioned(
                    top: Get.height * Utils.getResponsiveHeight(61),
                    left: 0,
                    right: 0,
                    child: AppBar(
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: Get.height * Utils.getResponsiveSize(24),
                          color: AppColor.textGreyPrimary,
                        ), // Change the color here
                        onPressed: () => Get.back(),
                      ),
                      centerTitle: true,
                      title: Text(
                        'reset_password'.tr,
                        style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: Get.height * Utils.getResponsiveSize(26),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ],
              )),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * Utils.getResponsiveWidth(30)),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(36),
                  ),
                  Image.asset(ImageAssets.img_verify),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(58),
                  ),
                  Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          InputNewPasswordWidget(),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(22),
                          ),
                          InputConfirmPasswordWidget(),
                        ],
                      )),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(50),
                  ),
                  ResetPasswordButtonWidget(formkey: _formkey, e_id: e_id),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(50),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
