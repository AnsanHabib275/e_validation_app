import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view_models/controller/updateProfile/update_profile_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/componants/RoundButton.dart';

class UpdateButtonWidget extends StatelessWidget {
  UpdateButtonWidget({Key? key, required this.formkey, required this.eid})
      : super(key: key);

  final formkey;
  final eid;
  final updateProfileVM = Get.put(UpdateProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'update'.tr,
        loading: updateProfileVM.loading.value,
        onPress: () {
          // Get.toNamed(RoutesName.accountCreatedScreen);
          if (formkey.currentState!.validate()) {
            updateProfileVM.updateProfileApi(eid);
          }
        },
      );
    });
  }
}
