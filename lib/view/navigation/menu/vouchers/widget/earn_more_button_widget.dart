import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/navigation/home/product/product_verify_done_screen.dart';
import 'package:e_validation/view_models/controller/navigation/complain/complain_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/componants/RoundButton.dart';
import '../../../../../view_models/controller/navigation/navigation_view_model.dart';

class EarnMoreButtonWidget extends StatelessWidget {
  EarnMoreButtonWidget({Key? key}) : super(key: key);

  final complaintVM = Get.put(ComplainViewModel());
  final navigationVM = Get.put(NavigationViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'earn_more'.tr,
        radius: 1.34,
        height: 14,
        width: 40,
        fontWeight: FontWeight.w400,
        fontSize: 6,
        loading: complaintVM.loading.value,
        onPress: () {
          // navigationVM.changeScreen(ProductVerifyDoneScreen());
          // Get.to(() => const ProductVerifyDoneScreen());
          // if (formkey.currentState!.validate()) {
          //   signUpVM.signUpApi();
          // }
        },
      );
    });
  }
}
