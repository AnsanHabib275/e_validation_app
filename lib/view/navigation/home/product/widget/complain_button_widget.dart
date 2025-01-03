import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/navigation/home/product/complain_screen.dart';
import 'package:e_validation/view_models/controller/navigation/complain/complain_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/componants/RoundButtonBorder.dart';
import '../../../../../view_models/controller/navigation/navigation_view_model.dart';

class ComplainButtonWidget extends StatelessWidget {
  ComplainButtonWidget({Key? key}) : super(key: key);

  final complaintVM = Get.put(ComplainViewModel());
  final navigationVM = Get.put(NavigationViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButtonBorder(
        width: double.infinity,
        height: 64,
        title: 'complain'.tr,
        loading: complaintVM.loading.value,
        onPress: () {
          navigationVM.changeScreen(ComplainScreen());
          // Get.to(() => const ComplainScreen());
          // Get.toNamed(RoutesName.complainScreen);
          // if (formkey.currentState!.validate()) {
          //   signUpVM.signUpApi();
          // }
        },
      );
    });
  }
}
