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
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          elevation: 0,
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
            'verification'.tr,
            style: TextStyle(
                color: AppColor.textColorPrimary,
                fontSize: 26,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
          actions: const <Widget>[],
        ),
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
                return Row(
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
                        nextFocusNode: verifyEmailVM.otpThreeFocusNode.value,
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
                );
              }),
              // Form(
              //   key: _formKey,
              //   child: Row(
              //     children: [],
              //   ),
              // child: OtpTextField(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     numberOfFields: 6,
              //     showFieldAsBox: true,
              //     filled: false,
              //     fieldHeight: Get.height * Utils.getResponsiveHeight(62),
              //     // fieldWidth: Get.width * Utils.getResponsiveWidth(62),
              //     borderWidth: 1,
              //     borderColor: AppColor.textBlack80Per.withOpacity(0.3),
              //     enabledBorderColor: AppColor.colorPrimary,
              //     disabledBorderColor:
              //         AppColor.textBlack80Per.withOpacity(0.3),
              //     borderRadius: BorderRadius.all(Radius.circular(8)),
              //     keyboardType: TextInputType.number,
              //     onSubmit: (code) async {
              //       Get.toNamed(RoutesName.accountCreatedScreen);
              //       // verifyEmailVM.verifyEmailApi(code.toString());
              //     }),
              // ),
              SizedBox(
                height: Get.height * Utils.getResponsiveHeight(40),
              ),
              Text(
                'resend_code'.tr,
                style: TextStyle(
                    color: AppColor.colorPrimary,
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: Get.height * Utils.getResponsiveHeight(70),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: VerifyButtonWidget(formKey: _formKey),
              ),
              SizedBox(
                height: Get.height * Utils.getResponsiveHeight(50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
