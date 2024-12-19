import 'package:e_validation/res/componants/RoundButtonBorder.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view_models/controller/navigation/complain/complain_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_models/controller/user_preference/user_preference_view_model.dart';


class YesButtonWidget extends StatelessWidget {
  YesButtonWidget({Key? key}) : super(key: key);

  final complaintVM = Get.put(ComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButtonBorder(
        width: Get.width * Utils.getResponsiveWidth(119),
        height: Get.height * Utils.getResponsiveHeight(42),
        title: 'yes'.tr,
        loading: complaintVM.loading.value,
        onPress: () {
          UserPreference userpreference = UserPreference();
          userpreference.removeUser();
          Get.offAllNamed(RoutesName
              .loginScreen);
        },
      );
    });
  }
}
