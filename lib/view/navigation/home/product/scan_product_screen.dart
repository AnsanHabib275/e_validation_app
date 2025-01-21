import 'dart:developer';

import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/navigation/home/product/fake_product_screen.dart';
import 'package:e_validation/view/navigation/home/product/product_verified_screen.dart';
import 'package:e_validation/view_models/controller/scanProduct/scan_product_view_model.dart';
import 'package:flutter/material.dart';
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
  String? _qrInfo = 'Scan a QR/Bar code';
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

  void _handleScan(String? code) async {
    if (code == null || code.isEmpty) return;
    print(code);
    // Remove specific substrings (if necessary).
    final processedCode =
        code.length > 4 ? code.substring(2, code.length - 2) : code;
    print(processedCode);
    final scanModel = await scanProductVM.scanProductApi(processedCode, eid!);

    // Update UI based on scan result.
    if (scanModel != null) {
      setState(() {
        model = scanModel;
        _camState = false;
      });

      // Navigate to appropriate screen based on model data.
      if (scanModel.data != null) {
        navigationVM.changeScreen(ProductVerifiedScreen());
      } else {
        navigationVM.changeScreen(FakeProductScreen());
      }
    } else {
      log("Failed to scan product");
    }
  }

  @override
  void initState() {
    super.initState();
    getUserDetail();
    _scanCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _camState
          ? SafeArea(
              child: Stack(
                children: [
                  Positioned(
                      right: 20,
                      top: 20,
                      child: Image.asset(IconAssets.ic_close)),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(60.0),
                        child: Image.asset(ImageAssets.scan_bg),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 65,
                    right: 65,
                    top: 65,
                    bottom: 65,
                    child: QRBarScannerCamera(
                      onError: (context, error) => Text(
                        error.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                      qrCodeCallback: _handleScan,
                      // qrCodeCallback: (code) async {
                      //   _qrCallback(code);
                      //
                      //   originalString = code;
                      //   // if (code!.length > 4) {
                      //   modifiedString = originalString!
                      //       .substring(2, originalString!.length - 2);
                      //   //   // log(modifiedString!.toString());
                      //   //   scanProductVM.scanProductApi(
                      //   //       modifiedString.toString(), eid!);
                      //   // } else {
                      //   //   scanProductVM.scanProductApi(
                      //   //       originalString.toString(), eid!);
                      //   // }
                      //   final Scanmodel? scanmodel = await scanProductVM
                      //       .scanProductApi(modifiedString.toString(), eid!);
                      //
                      //   if (scanmodel != null) {
                      //     setState(() {
                      //       model = scanmodel;
                      //     });
                      //   }
                      // }
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     navigationVM.changeScreen(ProductVerifiedScreen());
                    //   },
                    //   child: Image.asset(ImageAssets.product_with_qr_code),
                    // ),
                  ),
                ],
              ),
            )
          : model == null
              ? Center(
                  child: Text(
                    'No valid product found',
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  ),
                )
              : Container(),
      //     ? Center(
      //     navigationVM.changeScreen(ProductVerifiedScreen());
      // ): Center(
      //     navigationVM.changeScreen(FakeProductScreen());
      // )
    );
  }
}
