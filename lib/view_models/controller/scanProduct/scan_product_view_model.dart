import 'package:e_validation/repository/scan_product_repository/scan_product_repository.dart';
import 'package:e_validation/view/navigation/home/product/fake_product_screen.dart';
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
  RxString productHashCode = ''.obs;
  RxString productId = ''.obs;
  RxString scanCount = '0'.obs;

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
        scanCount.value = value['ScanCount'] ?? '0';
        productId.value = value['ProductId'] ?? '---';
        productHashCode.value = productHash;
        navigationVM.changeScreen(FakeProductScreen());
      } else {
        navigationVM.changeScreen(ProductVerifiedScreen());
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      setError(error.toString());
    });
  }
}
