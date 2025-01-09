import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/navigation/home/product/product_verify_done_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/componants/RoundButton.dart';
import '../../../../../view_models/controller/navigation/navigation_view_model.dart';
import '../../../../../view_models/controller/navigation/submitComplain/submit_complain_view_model.dart';

class SubmitButtonWidget extends StatelessWidget {
  SubmitButtonWidget({Key? key, required this.formkey}) : super(key: key);

  final formkey;
  final submitComplaintVM = Get.put(SubmitComplainViewModel());
  final navigationVM = Get.put(NavigationViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'submit'.tr,
        loading: submitComplaintVM.loading.value,
        onPress: () {
          navigationVM.changeScreen(ProductVerifyDoneScreen());
          // Get.to(() => const ProductVerifyDoneScreen());
          // if (formkey.currentState!.validate()) {
          //   signUpVM.signUpApi();
          // }
        },
      );
    });
  }
}
