import 'package:e_validation/view/navigation/home/product/complain_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../res/componants/RoundButtonBorder.dart';
import '../../../../../view_models/controller/navigation/navigation_view_model.dart';

class ComplainButtonWidget extends StatelessWidget {
  ComplainButtonWidget(
      {super.key,
      required this.code,
      required this.productId,
      required this.scanCount,
      required this.message});

  final navigationVM = Get.put(NavigationViewModel());
  final code;
  final productId;
  final scanCount;
  final message;

  @override
  Widget build(BuildContext context) {
    return RoundButtonBorder(
      width: 188,
      title: 'complain'.tr,
      onPress: () {
        final arguments = {
          'code': code,
          'productId': productId,
          'scanCount': scanCount,
          'message': message,
        };
        navigationVM.changeScreen(
          ComplainScreen(),
          arguments: arguments,
        );
      },
    );
  }
}
