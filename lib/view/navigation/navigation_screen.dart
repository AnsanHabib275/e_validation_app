import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view/navigation/complaints/complaints_screen.dart';
import 'package:e_validation/view/navigation/history/history_screen.dart';
import 'package:e_validation/view/navigation/home/home_screen.dart';
import 'package:e_validation/view/navigation/menu/faqs/faqs_screen.dart';
import 'package:e_validation/view/navigation/menu/kyc/kyc_screen.dart';
import 'package:e_validation/view/navigation/menu/points/points_screen.dart';
import 'package:e_validation/view/navigation/menu/profile/profile_screen.dart';
import 'package:e_validation/view/navigation/menu/redeem/redeem_reward_screen.dart';
import 'package:e_validation/view/navigation/menu/settings/settings_screen.dart';
import 'package:e_validation/view/navigation/notification/notification_screen.dart';
import 'package:e_validation/view/navigation/reward/reward_screen.dart';
import 'package:e_validation/view/navigation/widget/cancel_button_widget.dart';
import 'package:e_validation/view/navigation/widget/delete_button_widget.dart';
import 'package:e_validation/view/navigation/widget/input_email_widget.dart';
import 'package:e_validation/view/navigation/widget/no_button_widget.dart';
import 'package:e_validation/view/navigation/widget/yes_button_widget.dart';
import 'package:e_validation/view_models/controller/navigation/navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../models/navigation/menu_items_model.dart';
import '../../res/assets/font_assets.dart';
import '../../res/assets/icon_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/componants/MenuIcon.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final navigationVM = Get.put(NavigationViewModel());

  final List<MenuItemsModel> items = [
    MenuItemsModel(IconAssets.ic_menu_profile, 'Profile'),
    MenuItemsModel(IconAssets.ic_menu_redeem, 'Redeem'),
    MenuItemsModel(IconAssets.ic_menu_kyc, 'KYC'),
    MenuItemsModel(IconAssets.ic_menu_faqs, 'FAQS'),
    MenuItemsModel(IconAssets.ic_menu_settings, 'Settings'),
    MenuItemsModel(IconAssets.ic_menu_complaints, 'Complaints'),
    MenuItemsModel(IconAssets.ic_menu_points, 'Points'),
    MenuItemsModel(IconAssets.ic_menu_delete_account_new, 'Delete Account'),
    MenuItemsModel(IconAssets.ic_menu_logout, 'Logout'),
  ];
  Widget? _child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.splash_bg), // Your background image
              fit: BoxFit.cover, // Adjust to cover the entire screen
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.white,
          extendBody: true,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColor.lightGreyColor,
                        backgroundImage: AssetImage(ImageAssets.dummy_profile),
                      ),
                      Text(
                        'George Oliver',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: AppColor.textBlackPrimary,
                            fontSize: 20,
                            fontFamily: FontAssets.poppins_semi_bold),
                      ),
                      Text(
                        'Georgeoliver@gmail.com',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: AppColor.textBlackPrimary,
                            fontSize: 16,
                            fontFamily: FontAssets.poppins_regular),
                      ),
                    ],
                  ),
                ),
                ...items.asMap().entries.map((entry) {
                  int index = entry.key;
                  MenuItemsModel item = entry.value;
                  return Column(
                    children: [
                      ListTile(
                        leading:
                            Image.asset(item.imagePath, width: 30, height: 30),
                        title: Text(
                          item.name,
                          style: TextStyle(
                              fontFamily: FontAssets.poppins_medium,
                              fontSize: 18,
                              color: AppColor.textBlackPrimary),
                        ),
                        onTap: () {
                          _handleDrawerNavigationChange(item.name);
                        },
                      )
                    ],
                  );
                }).toList()
              ],
            ),
          ),
          body: Stack(
            children: [
              Center(
                child:
                    Obx(() => navigationVM.currentScreen.value ?? SizedBox()),
              ),
              SafeArea(
                child: const MenuIcon(),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: _handleNavigationChange,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(IconAssets.ic_bn_reward), label: ''),
              BottomNavigationBarItem(
                  icon: Image.asset(IconAssets.ic_bn_history), label: ''),
              BottomNavigationBarItem(
                  icon: Image.asset(IconAssets.ic_bn_home), label: ''),
              BottomNavigationBarItem(
                  icon: Image.asset(IconAssets.ic_bn_notification), label: ''),
              BottomNavigationBarItem(
                  icon: Image.asset(IconAssets.ic_bn_complaint), label: ''),
            ],
          ),
        ),
      ],
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          navigationVM.changeScreen(RewardScreen());
          break;
        case 1:
          navigationVM.changeScreen(HistoryScreen());
          break;
        case 2:
          navigationVM.changeScreen(HomeScreen());
          break;
        case 3:
          navigationVM.changeScreen(NotificationScreen());
          break;
        case 4:
          navigationVM.changeScreen(ComplaintsScreen());
          break;
        default:
          navigationVM.changeScreen(HomeScreen());
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.bounceIn,
        switchOutCurve: Curves.bounceOut,
        duration: Duration(milliseconds: 100),
        child: _child,
      );
    });
  }

  void _handleDrawerNavigationChange(String menuItem) {
    Get.back();
    setState(() {
      switch (menuItem) {
        case 'Profile':
          navigationVM.changeScreen(ProfileScreen());
          break;
        case 'Redeem':
          navigationVM.changeScreen(RedeemRewardScreen());
          break;
        case 'KYC':
          navigationVM.changeScreen(KYCScreen());
          break;
        case 'FAQS':
          navigationVM.changeScreen(FAQSScreen());
          break;
        case 'Settings':
          navigationVM.changeScreen(SettingsScreen());
          break;
        case 'Complaints':
          break;
        case 'Points':
          navigationVM.changeScreen(PointsScreen());
          break;
        case 'Delete Account':
          showDeleteAccountDialog();
          break;
        case 'Logout':
          showLogoutDialog();
          break;
        default:
          navigationVM.changeScreen(HomeScreen());
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.bounceIn,
        switchOutCurve: Curves.bounceOut,
        duration: Duration(milliseconds: 100),
        child: _child,
      );
    });
  }

  void showDeleteAccountDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        backgroundColor: Colors.white, // White background
        child: SizedBox(
          height: Get.height * Utils.getResponsiveHeight(364),
          width: Get.width * Utils.getResponsiveWidth(368),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // Center alignment
              children: [
                Image.asset(
                  height: 52,
                  width: 39,
                  ImageAssets.img_delete,
                ),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(22),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InputEmailWidget(),
                ),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(22),
                ),
                Text(
                  'are_you_sure_you_want_to_delete'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: FontAssets.poppins_regular,
                      color: AppColor.textBlackPrimary),
                ),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(32),
                ),
                // Quantity Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DeleteButtonWidget(),
                    SizedBox(width: Get.width * Utils.getResponsiveWidth(10)),
                    CancelButtonWidget(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showLogoutDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        backgroundColor: Colors.white, // White background
        child: SizedBox(
          height: Get.height * Utils.getResponsiveHeight(301),
          width: Get.width * Utils.getResponsiveWidth(368),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center alignment
            children: [
              SvgPicture.asset(
                height: 69,
                width: 69,
                ImageAssets.img_logout,
              ),
              SizedBox(
                height: Get.height * Utils.getResponsiveHeight(40),
              ),
              Text(
                'are_you_sure_you_want_to_logout'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontAssets.poppins_regular,
                    color: AppColor.textBlackPrimary),
              ),
              SizedBox(
                height: Get.height * Utils.getResponsiveHeight(30),
              ),
              // Quantity Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  YesButtonWidget(),
                  SizedBox(width: Get.width * Utils.getResponsiveWidth(6)),
                  NoButtonWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
