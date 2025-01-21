import 'package:e_validation/res/componants/RoundButtonBorder.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_models/controller/navigation/submitComplain/submit_complain_view_model.dart';
import '../../../view_models/controller/user_preference/user_preference_view_model.dart';

class YesButtonWidget extends StatelessWidget {
  YesButtonWidget({Key? key}) : super(key: key);

  final submitComplaintVM = Get.put(SubmitComplainViewModel());
  UserPreference userpreference = UserPreference();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButtonBorder(
        // width: Get.width * Utils.getResponsiveWidth(119),
        width: 119,
        height: 42,
        radius: 4,
        fontSize: 16,
        title: 'yes'.tr,
        loading: submitComplaintVM.loading.value,
        onPress: () {
          userpreference.removeUser();
          Get.offAllNamed(RoutesName.loginScreen);
        },
      );
    });
  }
}
