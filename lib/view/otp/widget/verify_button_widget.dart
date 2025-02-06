import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view_models/controller/otp/otp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/componants/RoundButton.dart';

class VerifyButtonWidget extends StatelessWidget {
  VerifyButtonWidget({Key? key, required this.formKey, required this.e_id})
      : super(key: key);

  final formKey;
  final e_id;
  final otpVM = Get.put(OTPViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'verify'.tr,
        loading: otpVM.loading.value,
        onPress: () {
          // Get.toNamed(RoutesName.resetPasswordScreen);
          if (formKey.currentState!.validate()) {
            otpVM.checkOtpFilled(e_id);
          }
        },
      );
    });
  }
}
