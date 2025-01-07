import 'package:e_validation/view/forget_password/widget/forget_password_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/routes/routes_name.dart';
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
          'forget_password'.tr,
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
              SizedBox(
                height: Get.height * 0.07,
              ),
              Form(key: _formkey, child: InputEmailWidget()),
              SizedBox(
                height: Get.height * 0.05,
              ),
              ForgetPasswordButtonWidget(formkey: _formkey)
            ],
          ),
        ),
      ),
    );
  }
}
