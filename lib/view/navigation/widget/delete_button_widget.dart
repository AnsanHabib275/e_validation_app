import 'package:e_validation/res/componants/RoundButtonBorder.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view_models/controller/navigation/complain/complain_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DeleteButtonWidget extends StatelessWidget {
  DeleteButtonWidget({Key? key}) : super(key: key);

  final complaintVM = Get.put(ComplainViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButtonBorder(
        width: Get.width * Utils.getResponsiveWidth(119),
        height: Get.height * Utils.getResponsiveHeight(42),
        title: 'delete'.tr,
        loading: complaintVM.loading.value,
        onPress: () {
          // Get.toNamed(RoutesName.accountCreatedScreen);
          // if (formkey.currentState!.validate()) {
          //   signUpVM.signUpApi();
          // }
        },
      );
    });
  }
}
