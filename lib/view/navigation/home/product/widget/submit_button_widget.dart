import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/navigation/home/product/product_verify_done_screen.dart';
import 'package:e_validation/view_models/controller/navigation/complain/complain_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/componants/RoundButton.dart';

class SubmitButtonWidget extends StatelessWidget {
  SubmitButtonWidget({Key? key, required this.formkey}) : super(key: key);

  final formkey;
  final complaintVM = Get.put(ComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        width: double.infinity,
        height: 64,
        title: 'submit'.tr,
        loading: complaintVM.loading.value,
        onPress: () {
          Get.to(() => const ProductVerifyDoneScreen());
          // if (formkey.currentState!.validate()) {
          //   signUpVM.signUpApi();
          // }
        },
      );
    });
  }
}
