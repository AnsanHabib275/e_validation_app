import 'package:e_validation/view_models/controller/changePassword/change_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/componants/RoundButton.dart';
import '../../../res/routes/routes_name.dart';
import '../../../view_models/controller/resetPassword/reset_password_view_model.dart';

class UpdatePasswordButtonWidget extends StatelessWidget {
  UpdatePasswordButtonWidget(
      {Key? key, required this.formkey, required this.e_id})
      : super(key: key);

  final formkey;
  final e_id;
  final changePasswordVM = Get.put(ChangePasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'update_password'.tr,
        loading: changePasswordVM.loading.value,
        onPress: () {
          Get.back();
          // if (formkey.currentState!.validate()) {
          //   resetPasswordVM.resetPasswordApi(e_id);
          // }
        },
      );
    });
  }
}
