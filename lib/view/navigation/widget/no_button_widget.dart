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
      width: 119,
      height: 42,
      radius: 4,
      fontSize: 16,
      title: 'no'.tr,
      onPress: () {
        Get.back();
      },
    );
  }
}
