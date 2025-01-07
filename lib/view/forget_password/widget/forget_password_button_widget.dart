import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view_models/controller/forgetPassword/forget_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/componants/RoundButton.dart';
import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class ForgetPasswordButtonWidget extends StatelessWidget {
  ForgetPasswordButtonWidget({Key? key, required this.formkey})
      : super(key: key);

  final formkey;
  final forgetPasswordVM = Get.put(ForgetPasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        width: 180,
        height: 50,
        title: 'send_otp'.tr,
        loading: forgetPasswordVM.loading.value,
        onPress: () {
          // Get.toNamed(RoutesName.navigationScreen);
          if (formkey.currentState!.validate()) {
            forgetPasswordVM.forgetPasswordApi();
          }
        },
      );
    });
  }
}
