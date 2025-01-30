import 'package:e_validation/view/change_password/widget/input_old_password_widget.dart';
import 'package:e_validation/view/change_password/widget/update_password_button_widget.dart';
import 'package:e_validation/view/reset_password/widget/input_new_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../utils/utils.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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
                        'update_password'.tr,
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
                          InputOldPasswordWidget(),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(22),
                          ),
                          InputNewPasswordWidget(),
                        ],
                      )),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(50),
                  ),
                  UpdatePasswordButtonWidget(formkey: _formkey, e_id: e_id),
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
