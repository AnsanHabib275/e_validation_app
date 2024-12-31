import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/componants/RoundButton.dart';
import '../../../../view_models/controller/navigation/navigation_view_model.dart';
import '../product/scan_product_screen.dart';

class ScanNowButtonWidget extends StatelessWidget {
  ScanNowButtonWidget({Key? key}) : super(key: key);

  final navigationVM = Get.put(NavigationViewModel());

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      title: 'scan_now'.tr,
      onPress: () {
        navigationVM.changeScreen(ScanProductScreen());
      },
    );
  }
}
