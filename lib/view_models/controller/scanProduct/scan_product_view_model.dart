import 'package:camera/camera.dart';
import 'package:e_validation/repository/scan_product_repository/scan_product_repository.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view/navigation/home/product/fake_product_screen.dart';
import 'package:e_validation/view/navigation/home/product/product_verified_screen.dart';
import 'package:e_validation/view_models/controller/navigation/navigation_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../models/navigation/scanProduct/scan_product_model.dart';
import '../user_preference/user_preference_view_model.dart';

class ScanProductViewModel extends GetxController {
  final navigationVM = Get.put(NavigationViewModel());
  Rx<CameraController?> cameraController = Rx<CameraController?>(null);
  RxString scanResult = 'Scan a QR/Bar code'.obs;
  Rx<DateTime?> lastScanTime = Rx<DateTime?>(null);
  Duration scanCooldown = const Duration(seconds: 2);
  RxBool loading = false.obs;
  RxString error = ''.obs;

  void setError(String value) => error.value = value;

  Future<void> processQRCode(String code) async {
    if (loading.value ||
        code == scanResult.value &&
            lastScanTime.value != null &&
            DateTime.now().difference(lastScanTime.value!) < scanCooldown) {
      return;
    }

    loading.value = true;
    lastScanTime.value = DateTime.now();

    try {
      await _pauseCamera();
      final response = await _makeApiCall(code);
      _handleApiResponse(response, code);
    } finally {
      loading.value = false;
      await _resumeCamera();
    }
  }

  Future<void> _pauseCamera() async {
    if (cameraController.value != null &&
        cameraController.value!.value.isStreamingImages) {
      await cameraController.value!.stopImageStream();
    }
  }

  Future<void> _resumeCamera() async {
    if (cameraController.value != null &&
        !cameraController.value!.value.isStreamingImages) {
      await cameraController.value!.startImageStream((image) {});
    }
  }

  Future<http.Response> _makeApiCall(String code) async {
    final body = jsonEncode({
      'productHash': code,
      'deviceIp': "",
      'deviceIdentity': "",
    });
    if (kDebugMode) {
      print(body);
    }
    return await http.post(
      Uri.parse("https://VLD-API-v1.beweb3.com/api/ScanProduct/"),
      body: body,
      headers: {
        "Content-Type": "application/json",
        'E_ID': Get.find<UserPreference>().user_eid.value,
      },
    );
  }

  void _handleApiResponse(http.Response response, String code) {
    if (kDebugMode) {
      print(response.body);
    }
    if (kDebugMode) {
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data["IsSuccessfull"]) {
        // if (data['ErrorCode'] == "1024") {
        // if (data['ErrorCode'] == "1025") {
        // if (data['ErrorCode'] == "1027") {
        ScanProductModel scanProductModel = ScanProductModel.fromJson(data);

        // Get.toNamed(RoutesName.productDetailScreen,
        //     arguments: scanProductModel);
        navigationVM.changeScreen(
          ProductVerifiedScreen(),
          arguments: scanProductModel,
        );
      } else {
        Utils.toastMessage('Invalid QR Code');
      }
    } else if (response.statusCode == 400) {
      final errorData = jsonDecode(response.body);
      if (errorData['ErrorCode'] == "1025") {
        final arguments = {
          'code': code,
          'productId': errorData['ProductId'] ?? '---',
          'scanCount': errorData['ScanCount'] ?? '0',
          'message': errorData['Message'] ?? '',
        };
        navigationVM.changeScreen(
          FakeProductScreen(),
          arguments: arguments,
        );
      } else {
        Utils.toastMessage('Invalid QR Code');
      }
    } else {
      error.value = 'Scan failed: ${response.statusCode}';
    }
  }
}
