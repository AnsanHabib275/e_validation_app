import 'package:e_validation/view/forget_password/widget/forget_password_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/colors/app_color.dart';
import '../../utils/utils.dart';
import '../../view_models/controller/forgetPassword/forget_password_view_model.dart';
import '../forget_password/widget/input_email_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final forgetPasswordVM = Get.put(ForgetPasswordViewModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
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
                      height: 1,
                      thickness: 1,
                      color: AppColor.textBlack10Per, // Customize divider color
                    ),
                  ),
                  Positioned(
                    top: Get.height * Utils.getResponsiveHeight(61),
                    left: 0,
                    right: 0,
                    child: AppBar(
                      backgroundColor: Colors.white,
                      leading: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 24,
                          color: AppColor.textGreyPrimary,
                        ), // Change the color here
                        onPressed: () => Get.back(),
                      ),
                      centerTitle: true,
                      title: Text(
                        'forgot_password'.tr,
                        style: TextStyle(
                            color: AppColor.textColorSecondary,
                            fontSize: 26,
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
                  horizontal: Get.width * Utils.getResponsiveWidth(23)),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(36),
                  ),
                  Text(
                    'no_worries_enter_your_email_for_reset_password'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.textLightBlackPrimary,
                        fontSize: Get.height * Utils.getResponsiveSize(18),
                        // fontSize: 18,
                        // height: Get.height * Utils.getResponsiveHeight(27) / 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(51),
                  ),
                  Form(key: _formkey, child: InputEmailWidget()),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(50),
                  ),
                  ForgetPasswordButtonWidget(formkey: _formkey)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
