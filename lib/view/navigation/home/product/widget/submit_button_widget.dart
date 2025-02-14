import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/navigation/home/product/product_verify_done_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/componants/RoundButton.dart';
import '../../../../../view_models/controller/navigation/navigation_view_model.dart';
import '../../../../../view_models/controller/navigation/submitComplain/submit_complain_view_model.dart';

class SubmitButtonWidget extends StatelessWidget {
  SubmitButtonWidget(
      {Key? key,
      required this.formkey,
      required this.eid,
      required this.productHash})
      : super(key: key);

  final formkey;
  final eid;
  final productHash;
  final submitComplaintVM = Get.put(SubmitComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'submit'.tr,
        loading: submitComplaintVM.loading.value,
        onPress: () {
          if (formkey.currentState!.validate()) {
            submitComplaintVM.submitComplaintApi(productHash, eid);
          }
        },
      );
    });
  }
}
