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
  bool _camState = false;

  Scanmodel? model;
  String? productid;
  String? originalString;
  String? modifiedString;

  // _qrCallback(code) {
  //   setState(() {
  //     _camState = false;
  //     _qrInfo = code;
  //   });
  // }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  String? eid = '';

  Future<void> getUserDetail() async {
    UserPreference userPreference = UserPreference();
    userPreference.getUser().then((user) {
      setState(() {
        eid = user.user?.eID;
      });
    });
  }

  // void _handleScan(String? code) async {
  //   if (code == null || code.isEmpty) return;
  //   print(code);
  //   // Remove specific substrings (if necessary).
  //   final processedCode =
  //       code.length > 4 ? code.substring(2, code.length - 2) : code;
  //   print(processedCode);
  //   final scanModel = await scanProductVM.scanProductApi(processedCode, eid!);
  //
  //   // Update UI based on scan result.
  //   if (scanModel != null) {
  //     setState(() {
  //       model = scanModel;
  //       _camState = false;
  //     });
  //
  //     // Navigate to appropriate screen based on model data.
  //     if (scanModel.data != null) {
  //       navigationVM.changeScreen(ProductVerifiedScreen());
  //     } else {
  //       navigationVM.changeScreen(FakeProductScreen());
  //     }
  //   } else {
  //     log("Failed to scan product");
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getUserDetail();
    // _scanCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      color:
                          Colors.white, // Add a background color for visibility
                      shape: BoxShape.circle, // Makes it rounded (optional)
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.3), // Shadow color with opacity
                          blurRadius: 8, // Soften the shadow
                          spreadRadius: 2, // Extend the shadow
                          offset: Offset(2, 4), // Moves shadow to bottom-right
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
                child: InkWell(
                    onTap: () {
                      navigationVM.changeScreen(ProductVerifiedScreen());
                    },
                    child: Image.asset(
                      ImageAssets.scan_bg,
                      height: Get.height * Utils.getResponsiveHeight(675),
                      width: Get.width * Utils.getResponsiveWidth(305),
                    )),
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
                    // qrCodeCallback: _handleScan,
                    qrCodeCallback: (code) async {
                      // _qrCallback(code);

                      originalString = code;
                      if (code!.length > 4) {
                        modifiedString = originalString!
                            .substring(2, originalString!.length - 2);
                        // log(modifiedString!.toString());
                        scanProductVM.scanProductApi(
                            modifiedString.toString(), eid!);
                      } else {
                        scanProductVM.scanProductApi(
                            originalString.toString(), eid!);
                      }

                      // final Scanmodel? scanmodel = await scanProductVM
                      //     .scanProductApi(modifiedString.toString(), eid!);
                      //
                      // if (scanmodel != null) {
                      //   setState(() {
                      //     model = scanmodel;
                      //   });
                      // }
                    }),
              ),
            ],
          ),
        )
        // : model == null
        //     ? Center(
        //         child: Text(
        //           'No valid product found',
        //           style: TextStyle(
        //               fontSize: Get.height * Utils.getResponsiveSize(18),
        //               color: Colors.red),
        //         ),
        //       )
        //     : Container(),
        //     ? Center(
        //     navigationVM.changeScreen(ProductVerifiedScreen());
        // ): Center(
        //     navigationVM.changeScreen(FakeProductScreen());
        // )
        );
  }
}
