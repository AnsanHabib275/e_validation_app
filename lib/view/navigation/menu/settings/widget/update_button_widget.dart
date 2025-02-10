import 'package:e_validation/view_models/controller/updateProfile/update_profile_view_model.dart';
import 'package:e_validation/view_models/controller/user_preference/user_preference_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/componants/RoundButton.dart';

class UpdateButtonWidget extends StatelessWidget {
  UpdateButtonWidget({Key? key, required this.formkey}) : super(key: key);

  final formkey;
  final updateProfileVM = Get.put(UpdateProfileViewModel());
  final userVM = Get.put(UserPreference());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'update'.tr,
        loading: updateProfileVM.loading.value,
        onPress: () {
          if (formkey.currentState!.validate()) {
            updateProfileVM.updateProfileApi(userVM.user_eid.value);
          }
        },
      );
    });
  }
}
