import 'dart:developer';

import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view/navigation/home/home_screen.dart';
import 'package:e_validation/view/navigation/home/product/fake_product_screen.dart';
import 'package:e_validation/view/navigation/home/product/product_verified_screen.dart';
import 'package:e_validation/view_models/controller/scanProduct/scan_product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:get/get.dart';

import '../../../../models/scan_data_model.dart';
import '../../../../view_models/controller/navigation/navigation_view_model.dart';
import '../../../../view_models/controller/user_preference/user_preference_view_model.dart';

class ScanProductScreen extends StatefulWidget {
  const ScanProductScreen({super.key});

  @override
  State<ScanProductScreen> createState() => _ScanProductScreenState();
}

class _ScanProductScreenState extends State<ScanProductScreen>
    with SingleTickerProviderStateMixin {
  final navigationVM = Get.put(NavigationViewModel());
  final scanProductVM = Get.put(ScanProductViewModel());
  final userVM = Get.put(UserPreference());

  String? originalString;
  String? modifiedString;
  bool _isScanning = false;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  right: Get.width * Utils.getResponsiveWidth(10),
                  top: Get.height * Utils.getResponsiveHeight(30),
                  child: InkWell(
                    onTap: () {
                      // navigationVM.changeScreen(HomeScreen());
                      navigationVM.changeScreen(ProductVerifiedScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(
                          Get.height * Utils.getResponsiveHeight(10)),
                      child: Image.asset(IconAssets.ic_close),
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * Utils.getResponsiveHeight(70),
                  left: Get.width * Utils.getResponsiveWidth(70),
                  right: Get.width * Utils.getResponsiveWidth(70),
                  bottom: Get.height * Utils.getResponsiveHeight(70),
                  child: Image.asset(
                    ImageAssets.scan_bg,
                    height: Get.height * Utils.getResponsiveHeight(675),
                    width: Get.width * Utils.getResponsiveWidth(305),
                  ),
                ),
                Positioned(
                  left: Get.width * Utils.getResponsiveWidth(75),
                  right: Get.width * Utils.getResponsiveWidth(75),
                  top: Get.height * Utils.getResponsiveHeight(120),
                  bottom: Get.height * Utils.getResponsiveHeight(120),
                  child: QRBarScannerCamera(
                      onError: (context, error) => Text(
                            error.toString(),
                            style: const TextStyle(color: Colors.red),
                          ),
                      qrCodeCallback: (code) async {
                        if (_isScanning) return;
                        _isScanning = true;

                        originalString = code;
                        if (code!.length > 4) {
                          modifiedString = originalString!
                              .substring(2, originalString!.length - 2);
                          scanProductVM.scanProductApi(
                              modifiedString.toString(), userVM.user_eid.value);
                        } else {
                          scanProductVM.scanProductApi(
                              originalString.toString(), userVM.user_eid.value);
                        }
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
