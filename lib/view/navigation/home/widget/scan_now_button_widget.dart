import 'package:e_validation/res/routes/routes.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/navigation/home/product/scan_product_screen.dart';
import 'package:e_validation/view/navigation/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/componants/RoundButton.dart';
import '../product/fake_product_screen.dart';

class ScanNowButtonWidget extends StatelessWidget {
  ScanNowButtonWidget({Key? key}) : super(key: key);

  // final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      title: 'scan_now'.tr,
      // loading: loginVM.loading.value,
      onPress: () {
        Get.toNamed(RoutesName.scanProductScreen);
        // if (formkey.currentState!.validate()) {
        //   loginVM.loginApi();
        // }
      },
    );
  }
}
