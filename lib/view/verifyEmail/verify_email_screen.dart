import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view/verifyEmail/widget/input_otp_widget.dart';
import 'package:e_validation/view/verifyEmail/widget/verify_button_widget.dart';
import 'package:e_validation/view_models/controller/verifyEmail/verify_email_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final verifyEmailVM = Get.put(VerifyEmailViewModel());
  final _formKey = GlobalKey<FormState>();
  // final email = Get.arguments['email'];
  // final from = Get.arguments['from'];
  final email = '';
  final from = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyEmailVM.from.value = from;
  }

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
                        'verification'.tr,
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
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(36),
                ),
                Image.asset(ImageAssets.img_verify),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(58),
                ),
                Obx(() {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 40,
                          height: 50,
                          child: InputOTPWidget(
                            email: email,
                            controller: verifyEmailVM.otpOneController.value,
                            focusNode: verifyEmailVM.otpOneFocusNode.value,
                            nextFocusNode: verifyEmailVM.otpTwoFocusNode.value,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 50,
                          child: InputOTPWidget(
                            email: email,
                            controller: verifyEmailVM.otpTwoController.value,
                            focusNode: verifyEmailVM.otpTwoFocusNode.value,
                            nextFocusNode:
                                verifyEmailVM.otpThreeFocusNode.value,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 50,
                          child: InputOTPWidget(
                            email: email,
                            controller: verifyEmailVM.otpThreeController.value,
                            focusNode: verifyEmailVM.otpThreeFocusNode.value,
                            nextFocusNode: verifyEmailVM.otpFourFocusNode.value,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 50,
                          child: InputOTPWidget(
                            email: email,
                            controller: verifyEmailVM.otpFourController.value,
                            focusNode: verifyEmailVM.otpFourFocusNode.value,
                            nextFocusNode: verifyEmailVM.otpFiveFocusNode.value,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 50,
                          child: InputOTPWidget(
                            email: email,
                            controller: verifyEmailVM.otpFiveController.value,
                            focusNode: verifyEmailVM.otpFiveFocusNode.value,
                            nextFocusNode: verifyEmailVM.otpSixFocusNode.value,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 50,
                          child: InputOTPWidget(
                            email: email,
                            controller: verifyEmailVM.otpSixController.value,
                            focusNode: verifyEmailVM.otpSixFocusNode.value,
                            // nextFocusNode: verifyEmailVM.otpFourFocusNode.value,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(40),
                ),
                Text(
                  'resend_code'.tr,
                  style: TextStyle(
                      color: AppColor.colorPrimary,
                      decoration: TextDecoration.underline,
                      fontSize: Get.height * Utils.getResponsiveSize(18),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(70),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * Utils.getResponsiveWidth(30)),
                  child: VerifyButtonWidget(formKey: _formKey),
                ),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(50),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
