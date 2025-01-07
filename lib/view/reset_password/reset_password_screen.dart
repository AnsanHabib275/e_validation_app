import 'package:e_validation/view/reset_password/widget/input_password_widget.dart';
import 'package:e_validation/view/reset_password/widget/input_reset_code_widget.dart';
import 'package:e_validation/view/reset_password/widget/reset_password_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../res/assets/font_assets.dart';
import '../../res/assets/image_assets.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formkey = GlobalKey<FormState>();
  final e_id = Get.arguments['e_id'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        title: Text(
          'reset_password'.tr,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.07,
              ),
              SvgPicture.asset(ImageAssets.forgetpass),
              // Image(image: AssetImage(ImageAssets.forgetpass)),
              SizedBox(
                height: Get.height * 0.07,
              ),

              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      const InputResetCodeWidget(),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      InputPasswordWidget(),
                    ],
                  )),
              SizedBox(
                height: Get.height * 0.05,
              ),
              ResetPasswordButtonWidget(formkey: _formkey, e_id: e_id)
              // RoundButton(
              //     title: 'reset_password'.tr,
              //     width: double.infinity,
              //     onPress: () {}),
              // InkWell(
              //   onTap: () {
              //     // Get.toNamed(RoutesName.signUpScreen);
              //   },
              //   child: Container(
              //     height: 50,
              //     width: 180,
              //     decoration: BoxDecoration(
              //         color: AppColor.colorPrimaryLightBlue,
              //         borderRadius: BorderRadius.circular(8)),
              //     child: Center(
              //       child: Text(
              //         'reset_password'.tr,
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //             color: AppColor.whiteColor,
              //             fontWeight: FontWeight.bold,
              //             fontSize: 15),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
