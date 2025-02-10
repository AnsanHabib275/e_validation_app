import 'package:e_validation/view_models/controller/changePassword/change_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/componants/RoundButton.dart';

class UpdatePasswordButtonWidget extends StatelessWidget {
  UpdatePasswordButtonWidget({super.key, required this.formkey});

  final formkey;
  final changePasswordVM = Get.put(ChangePasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'update_password'.tr,
        loading: changePasswordVM.loading.value,
        onPress: () {
          if (formkey.currentState!.validate()) {
            changePasswordVM.changePasswordApi();
          }
        },
      );
    });
  }
}
