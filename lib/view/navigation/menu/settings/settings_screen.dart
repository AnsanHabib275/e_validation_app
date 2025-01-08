import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/navigation/home/product/widget/done_button_widget.dart';
import 'package:e_validation/view_models/controller/changePassword/change_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../res/assets/font_assets.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final changePasswordVM = Get.put(ChangePasswordViewModel());
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: Get.width * Utils.getResponsiveWidth(428),
              height: Get.height * Utils.getResponsiveHeight(461),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets
                      .product_detail_bg), // Replace with your image path
                  fit: BoxFit.cover, // Adjust the image to fill the screen
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImageAssets.img_settings,
                    height: Get.height * Utils.getResponsiveHeight(216),
                    width: Get.width * Utils.getResponsiveWidth(262),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Text(
                    'settings'.tr,
                    style: TextStyle(
                        color: AppColor.textColorPrimary,
                        fontSize: 26,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
              child: InkWell(
                onTap: () {
                  showChangePasswordDialog();
                },
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(IconAssets.ic_change_password),
                        SizedBox(
                          width: Get.width * Utils.getResponsiveWidth(16),
                        ),
                        Expanded(
                          child: Text(
                            'change_password'.tr,
                            style: TextStyle(
                                color: AppColor.textBlack80Per,
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Image.asset(
                          IconAssets.ic_submitted_complaint,
                          height: 15,
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
              child: InkWell(
                onTap: () {
                  // Get.toNamed(RoutesName.updateProfileScreen);
                },
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(IconAssets.ic_change_password),
                        SizedBox(
                          width: Get.width * Utils.getResponsiveWidth(16),
                        ),
                        Expanded(
                          child: Text(
                            'update_profile'.tr,
                            style: TextStyle(
                                color: AppColor.textBlack80Per,
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Image.asset(
                          IconAssets.ic_submitted_complaint,
                          height: 15,
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showChangePasswordDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        backgroundColor: Colors.white, // White background
        child: SizedBox(
          height: Get.height * Utils.getResponsiveHeight(301),
          width: Get.width * Utils.getResponsiveWidth(368),
          child: Stack(children: [
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              left: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center alignment
                children: <Widget>[
                  Text('update_password'.tr),
                  TextField(
                    obscureText: true,
                    controller: changePasswordVM.oldPasswordController.value,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock_open_sharp),
                      labelText: 'Existing Password',
                    ),
                  ),
                  TextField(
                    controller: changePasswordVM.newPasswordController.value,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'New Password',
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 0, right: 0, child: Image.asset(IconAssets.ic_close))
          ]),
        ),
      ),
    );
  }

  // _onAlertWithCustomContentPressed(context) {
  //   Get.dialog(Alert(
  //       context: context,
  //       title: "Update Password",
  //       content: Column(
  //         children: <Widget>[
  //           TextField(
  //             obscureText: true,
  //             controller: old_pass,
  //             decoration: const InputDecoration(
  //               icon: Icon(Icons.lock_open_sharp),
  //               labelText: 'Existing Password',
  //             ),
  //           ),
  //           TextField(
  //             controller: new_pass,
  //             obscureText: true,
  //             decoration: const InputDecoration(
  //               icon: Icon(Icons.lock),
  //               labelText: 'New Password',
  //             ),
  //           ),
  //         ],
  //       ),
  //       buttons: [
  //         DialogButton(
  //           color: appcolor.copybuttonColor,
  //           onPressed: () {
  //             showAlertDialog(context, "Updating");
  //             Pass_update.pass_update(old_pass.text, new_pass.text);
  //             old_pass.clear();
  //             new_pass.clear();
  //           },
  //           child: const Text(
  //             "Done",
  //             style: TextStyle(color: Colors.white, fontSize: 20),
  //           ),
  //         )
  //       ]).show());
  // }
}
