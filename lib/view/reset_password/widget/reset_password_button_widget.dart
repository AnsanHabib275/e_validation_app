import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/componants/RoundButton.dart';
import '../../../res/routes/routes_name.dart';
import '../../../view_models/controller/resetPassword/reset_password_view_model.dart';

class ResetPasswordButtonWidget extends StatelessWidget {
  ResetPasswordButtonWidget(
      {super.key, required this.formkey, required this.e_id});

  final formkey;
  final e_id;
  final resetPasswordVM = Get.put(ResetPasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'reset_password'.tr,
        loading: resetPasswordVM.loading.value,
        onPress: () {
          if (formkey.currentState!.validate()) {
            resetPasswordVM.resetPasswordApi(e_id);
          }
        },
      );
    });
  }
}
