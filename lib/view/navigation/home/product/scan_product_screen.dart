import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/navigation/home/product/product_verified_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../view_models/controller/navigation/navigation_view_model.dart';

class ScanProductScreen extends StatefulWidget {
  const ScanProductScreen({super.key});

  @override
  State<ScanProductScreen> createState() => _ScanProductScreenState();
}

class _ScanProductScreenState extends State<ScanProductScreen> {
  final navigationVM = Get.put(NavigationViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                right: 20, top: 20, child: Image.asset(IconAssets.ic_close)),
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
                left: 0,
                right: 0,
                top: 100,
                bottom: 0,
                child: InkWell(
                    onTap: () {
                      navigationVM.changeScreen(ProductVerifiedScreen());
                    },
                    child: Image.asset(ImageAssets.product_with_qr_code))),
          ],
        ),
      ),
    );
  }
}
