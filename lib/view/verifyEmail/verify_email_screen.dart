import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
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
              size: 20,
              color: AppColor.colorPrimary,
            ), // Change the color here
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: const Text(
            'Verification',
            style: TextStyle(
              color: AppColor.colorPrimary,
            ),
          ),
          actions: const <Widget>[],
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: Get.height * 0.05),
                    child:
                        Center(child: Image.asset(ImageAssets.dummy_profile)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Get.width * 0.02),
                    child: const Text(
                      'Verification',
                      style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 26,
                          letterSpacing: 1,
                          color: AppColor.colorPrimary,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.all(Get.width * 0.02),
                    child: const Text(
                      'Enter your OTP code number',
                      style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 16,
                          letterSpacing: 0,
                          color: AppColor.colorPrimary,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  OtpTextField(
                      mainAxisAlignment: MainAxisAlignment.center,
                      numberOfFields: 6,
                      fillColor: Colors.black.withOpacity(0.1),
                      filled: true,
                      keyboardType: TextInputType.number,
                      onSubmit: (code) async {
                        // context.loaderOverlay.show(); // Show load
                        // await Api_Verifymail.verifymail(
                        //     code.toString(), context);
                        verifyEmailVM.verifyEmailApi(code.toString());
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('I didn\'t receive OTP ?',
                        style: TextStyle(
                          color: AppColor.colorPrimary,
                        )),
                    TextButton(
                        onPressed: () async {},
                        child: const Text(
                          '/   Resend',
                          style: TextStyle(color: AppColor.colorPrimary),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
