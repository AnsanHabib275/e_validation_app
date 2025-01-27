import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view/otp/widget/input_otp_widget.dart';
import 'package:e_validation/view/otp/widget/verify_button_widget.dart';
import 'package:e_validation/view_models/controller/otp/otp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpVM = Get.put(OTPViewModel());
  final _formKey = GlobalKey<FormState>();
  // final email = Get.arguments['email'];
  // final from = Get.arguments['from'];
  final email = '';
  final from = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    otpVM.from.value = from;
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
                      backgroundColor: Colors.white,
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
                            color: AppColor.textColorSecondary,
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
                            controller: otpVM.otpOneController.value,
                            focusNode: otpVM.otpOneFocusNode.value,
                            nextFocusNode: otpVM.otpTwoFocusNode.value,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 50,
                          child: InputOTPWidget(
                            email: email,
                            controller: otpVM.otpTwoController.value,
                            focusNode: otpVM.otpTwoFocusNode.value,
                            nextFocusNode: otpVM.otpThreeFocusNode.value,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 50,
                          child: InputOTPWidget(
                            email: email,
                            controller: otpVM.otpThreeController.value,
                            focusNode: otpVM.otpThreeFocusNode.value,
                            nextFocusNode: otpVM.otpFourFocusNode.value,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 50,
                          child: InputOTPWidget(
                            email: email,
                            controller: otpVM.otpFourController.value,
                            focusNode: otpVM.otpFourFocusNode.value,
                            nextFocusNode: otpVM.otpFiveFocusNode.value,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 50,
                          child: InputOTPWidget(
                            email: email,
                            controller: otpVM.otpFiveController.value,
                            focusNode: otpVM.otpFiveFocusNode.value,
                            nextFocusNode: otpVM.otpSixFocusNode.value,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 50,
                          child: InputOTPWidget(
                            email: email,
                            controller: otpVM.otpSixController.value,
                            focusNode: otpVM.otpSixFocusNode.value,
                            // nextFocusNode: otpVM.otpFourFocusNode.value,
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
