import 'package:e_validation/res/routes/routes_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/componants/RoundButtonBorder.dart';
import '../../../res/componants/RoundButton.dart';
import '../../../utils/utils.dart';

class CancelButtonWidget extends StatelessWidget {
  CancelButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return RoundButton(
      width: Get.width * Utils.getResponsiveWidth(119),
      height: Get.height * Utils.getResponsiveHeight(42),
      radius: 4,
      fontSize: 16,
      title: 'cancel'.tr,
      onPress: () {
        Get.back();
      },
    );
    // });
  }
}
