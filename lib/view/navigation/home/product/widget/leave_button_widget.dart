import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/navigation/home/home_screen.dart';
import 'package:e_validation/view_models/controller/navigation/complain/complain_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/componants/RoundButton.dart';
import '../../../../../view_models/controller/navigation/navigation_view_model.dart';

class LeaveButtonWidget extends StatelessWidget {
  LeaveButtonWidget({Key? key}) : super(key: key);

  final complaintVM = Get.put(ComplainViewModel());
  final navigationVM = Get.put(NavigationViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        width: double.infinity,
        height: 64,
        title: 'leave'.tr,
        loading: complaintVM.loading.value,
        onPress: () {
          navigationVM.changeScreen(HomeScreen());
          // Get.to(() => const HomeScreen());
          // if (formkey.currentState!.validate()) {
          //   signUpVM.signUpApi();
          // }
        },
      );
    });
  }
}
