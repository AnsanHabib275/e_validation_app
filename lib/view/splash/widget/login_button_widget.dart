import 'package:e_validation/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/componants/RoundButton.dart';

class LoginButtonWidget extends StatelessWidget {
  LoginButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      title: 'login'.tr,
      onPress: () {
        Get.toNamed(RoutesName.loginScreen);
      },
    );
  }
}
