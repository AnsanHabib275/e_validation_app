import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/navigation/home/home_screen.dart';
import 'package:e_validation/view_models/controller/navigation/navigation_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/componants/RoundButton.dart';
import '../../../../../utils/utils.dart';
import '../../../../../view_models/controller/navigation/submitComplain/submit_complain_view_model.dart';

class DoneButtonWidget extends StatelessWidget {
  DoneButtonWidget({Key? key}) : super(key: key);

  final submitComplaintVM = Get.put(SubmitComplainViewModel());
  final navigationVM = Get.put(NavigationViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'done'.tr,
        loading: submitComplaintVM.loading.value,
        onPress: () {
          navigationVM.changeScreen(HomeScreen());
          // Get.to(() => const HomeScreen());
          // Get.toNamed(RoutesName.notEligibleScreen);
          // if (formkey.currentState!.validate()) {
          //   signUpVM.signUpApi();
          // }
        },
      );
    });
  }
}
