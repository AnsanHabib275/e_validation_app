import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/navigation/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/componants/RoundButton.dart';
import '../../../../../view_models/controller/navigation/navigation_view_model.dart';

class LeaveButtonWidget extends StatelessWidget {
  LeaveButtonWidget({Key? key}) : super(key: key);

  final navigationVM = Get.put(NavigationViewModel());

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: 188,
      title: 'leave'.tr,
      onPress: () {
        navigationVM.changeScreen(HomeScreen());
      },
    );
  }
}
