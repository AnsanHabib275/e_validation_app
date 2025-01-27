import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/componants/RoundButton.dart';
import '../../../utils/utils.dart';

class NoButtonWidget extends StatelessWidget {
  NoButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: Get.width * Utils.getResponsiveWidth(119),
      height: Get.height * Utils.getResponsiveHeight(42),
      radius: Get.height * Utils.getResponsiveSize(4),
      fontSize: Get.height * Utils.getResponsiveSize(16),
      title: 'no'.tr,
      onPress: () {
        Get.back();
      },
    );
  }
}
