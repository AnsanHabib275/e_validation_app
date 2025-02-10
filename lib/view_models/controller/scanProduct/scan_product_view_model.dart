import 'package:e_validation/repository/scan_product_repository/scan_product_repository.dart';
import 'package:e_validation/view/navigation/home/product/product_verified_screen.dart';
import 'package:e_validation/view_models/controller/navigation/navigation_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';

class ScanProductViewModel extends GetxController {
  final _api = ScanProductRepository();
  final navigationVM = Get.put(NavigationViewModel());

  RxBool loading = false.obs;
  RxString error = ''.obs;

  void setError(String _value) => error.value = _value;

  void scanProductApi(String productHash, String eid) {
    loading.value = true;
    Map data = {
      'productHash': productHash,
      'deviceIp': "",
      'deviceIdentity': "",
    };
    if (kDebugMode) {
      print(data);
    }
    _api.scanProductApi(data, eid).then((value) {
      loading.value = false;
      if (kDebugMode) {
        print(value);
      }
      // bool check = value["IsSuccessfull"];
      if (value['ErrorCode'] == "1025") {
        Utils.toastMessage('Fake Product');
        String scanCount = value['ScanCount'] ?? '0';

        String productid = value['ProductId'] ?? '---';
        Get.toNamed(RoutesName.complainScreen, arguments: {
          productHash: productHash.toString(),
          productid: productid,
          scanCount: scanCount,
        });
      } else {
        navigationVM.changeScreen(ProductVerifiedScreen());
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      setError(error.toString());
    });
  }
}
