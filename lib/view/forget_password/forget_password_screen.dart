import 'package:e_validation/view/forget_password/widget/forget_password_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/routes/routes_name.dart';
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
          appBar: AppBar(
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(36),
                  ),
                  Text(
                    'no_worries_enter_your_email_for_reset_password'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.textBlack80Per,
                        fontSize: 18,
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
