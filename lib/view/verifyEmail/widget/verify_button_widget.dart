import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view_models/controller/verifyEmail/verify_email_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/componants/RoundButton.dart';

class VerifyButtonWidget extends StatelessWidget {
  VerifyButtonWidget({Key? key, required this.formKey}) : super(key: key);

  final formKey;
  final verifyEmailVM = Get.put(VerifyEmailViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'verify'.tr,
        loading: verifyEmailVM.loading.value,
        onPress: () {
          Get.toNamed(RoutesName.resetPasswordScreen);
          // if (formkey.currentState!.validate()) {
          //   signUpVM.signUpApi();
          // }
        },
      );
    });
  }
}
