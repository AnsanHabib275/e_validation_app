import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/view/navigation/menu/settings/widget/input_date_of_birth_widget.dart';
import 'package:e_validation/view/navigation/menu/settings/widget/input_first_name_widget.dart';
import 'package:e_validation/view/navigation/menu/settings/widget/input_last_name_widget.dart';
import 'package:e_validation/view/navigation/menu/settings/widget/input_phone_number_widget.dart';
import 'package:e_validation/view/navigation/menu/settings/widget/update_button_widget.dart';
import 'package:e_validation/view_models/controller/updateProfile/update_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../view_models/controller/user_preference/user_preference_view_model.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final updateProfileVM = Get.put(UpdateProfileViewModel());
  final userVM = Get.put(UserPreference());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(Get.height * Utils.getResponsiveHeight(124)),
              child: Stack(
                children: [
                  Positioned(
                    top: Get.height * Utils.getResponsiveHeight(60),
                    left: 0,
                    right: 0,
                    child: Divider(
                      height: Get.height * Utils.getResponsiveHeight(1),
                      thickness: 1,
                      color: AppColor.textBlack10Per, // Customize divider color
                    ),
                  ),
                  Positioned(
                    top: Get.height * Utils.getResponsiveHeight(61),
                    left: 0,
                    right: 0,
                    child: AppBar(
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: Get.height * Utils.getResponsiveSize(24),
                          color: AppColor.textGreyPrimary,
                        ), // Change the color here
                        onPressed: () => Get.back(),
                      ),
                      centerTitle: true,
                      title: Text(
                        'update_profile'.tr,
                        style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: Get.height * Utils.getResponsiveSize(26),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ],
              )),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * Utils.getResponsiveWidth(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(36),
                  ),
                  Container(
                    height: Get.height * Utils.getResponsiveHeight(145),
                    width: Get.width * Utils.getResponsiveWidth(127),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              _showImageSourceDialog(context);
                            },
                            child: SizedBox(
                                height:
                                    Get.height * Utils.getResponsiveHeight(127),
                                width:
                                    Get.width * Utils.getResponsiveWidth(127),
                                child: Obx(() {
                                  return CircleAvatar(
                                    radius: Get.height *
                                        Utils.getResponsiveSize(62),
                                    child: updateProfileVM.imagePath.isEmpty
                                        ? SvgPicture.asset(
                                            ImageAssets
                                                .img_profile, // Your default SVG image path
                                            fit: BoxFit.cover,
                                          )
                                        : ClipOval(
                                            child: Image.network(
                                              updateProfileVM.imagePath
                                                  .value, // The selected or updated image path
                                              fit: BoxFit.cover,
                                              height: Get.height *
                                                  Utils.getResponsiveHeight(
                                                      127),
                                              width: Get.width *
                                                  Utils.getResponsiveWidth(127),
                                            ),
                                          ),
                                  );
                                })),
                          ),
                        ),
                        // child: SvgPicture.asset(
                        //     ImageAssets.img_profile)))),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: SvgPicture.asset(ImageAssets.img_add_photo))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(70),
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        InputFirstNameWidget(),
                        SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(22)),
                        InputLastNameWidget(),
                        SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(22)),
                        InputPhoneNumberWidget(),
                        SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(22)),
                        InputDateOfBirthWidget(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(50),
                  ),
                  UpdateButtonWidget(
                    formkey: _formkey,
                  ),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(50),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showImageSourceDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('select_image_source'.tr),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text('camera'.tr),
                onTap: () {
                  Get.back();
                  updateProfileVM.takeImageFromCamera(userVM.user_eid.value);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: Text('gallery'.tr),
                onTap: () {
                  Get.back();
                  updateProfileVM.getImageFromGallery(userVM.user_eid.value);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
