import 'package:e_validation/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/componants/RoundButton.dart';
import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  LoginButtonWidget({Key? key, required this.formkey}) : super(key: key);

  final formkey;
  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'login'.tr,
        loading: loginVM.loading.value,
        onPress: () {
          if (formkey.currentState!.validate()) {
            loginVM.loginApi();
          }
        },
      );
    });
  }
}
