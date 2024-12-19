import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view_models/controller/navigation/complain/complain_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/componants/RoundButtonBorder.dart';
import '../../../res/componants/RoundButton.dart';
import '../../../utils/utils.dart';


class CancelButtonWidget extends StatelessWidget {
  CancelButtonWidget({Key? key}) : super(key: key);

  final complaintVM = Get.put(ComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        width: Get.width * Utils.getResponsiveWidth(119),
        height: Get.height * Utils.getResponsiveHeight(42),
        title: 'cancel'.tr,
        loading: complaintVM.loading.value,
        onPress: () {
          Get.back();
        },
      );
    });
  }
}
