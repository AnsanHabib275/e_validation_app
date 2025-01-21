import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view/navigation/home/product/product_verify_done_screen.dart';
import 'package:e_validation/view/navigation/menu/vouchers/vouchers_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/componants/RoundButton.dart';
import '../../../../../view_models/controller/navigation/navigation_view_model.dart';

class EarnMoreButtonWidget extends StatelessWidget {
  EarnMoreButtonWidget({Key? key}) : super(key: key);

  final navigationVM = Get.put(NavigationViewModel());

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return RoundButton(
      title: 'earn_more'.tr,
      radius: 1.34,
      height: Get.height * Utils.getResponsiveHeight(14),
      width: Get.width * Utils.getResponsiveWidth(40),
      fontSize: 6,
      onPress: () {
        navigationVM.changeScreen(VouchersScreen());
        // Get.to(() => const ProductVerifyDoneScreen());
        // if (formkey.currentState!.validate()) {
        //   signUpVM.signUpApi();
        // }
      },
    );
    // });
  }
}
