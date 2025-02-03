import 'package:e_validation/view/navigation/home/product/complain_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/componants/RoundButtonBorder.dart';
import '../../../../../view_models/controller/navigation/navigation_view_model.dart';

class ComplainButtonWidget extends StatelessWidget {
  ComplainButtonWidget({Key? key}) : super(key: key);

  final navigationVM = Get.put(NavigationViewModel());

  @override
  Widget build(BuildContext context) {
    return RoundButtonBorder(
      width: 188,
      title: 'complain'.tr,
      onPress: () {
        navigationVM.changeScreen(ComplainScreen());
      },
    );
  }
}
