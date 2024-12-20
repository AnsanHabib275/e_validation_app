import 'package:e_validation/res/routes/routes_name.dart';
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
      width: double.infinity,
      height: 64,
      title: 'scan_now'.tr,
      // loading: loginVM.loading.value,
      onPress: () {
        Get.to(() => const FakeProductScreen());
        // Get.toNamed(RoutesName.scanProductScreen);
        // if (formkey.currentState!.validate()) {
        //   loginVM.loginApi();
        // }
      },
    );
  }
}
