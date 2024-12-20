import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view/navigation/complaints/complaints_screen.dart';
import 'package:e_validation/view/navigation/history/history_screen.dart';
import 'package:e_validation/view/navigation/home/home_screen.dart';
import 'package:e_validation/view/navigation/home/product/complain_screen.dart';
import 'package:e_validation/view/navigation/home/product/fake_product_screen.dart';
import 'package:e_validation/view/navigation/home/product/product_verified_screen.dart';
import 'package:e_validation/view/navigation/home/product/product_verify_done_screen.dart';
import 'package:e_validation/view/navigation/home/product/scan_product_screen.dart';
import 'package:e_validation/view/navigation/menu/faqs/faqs_screen.dart';
import 'package:e_validation/view/navigation/menu/kyc/kyc_screen.dart';
import 'package:e_validation/view/navigation/menu/profile/profile_screen.dart';
import 'package:e_validation/view/navigation/menu/settings/settings_screen.dart';
import 'package:e_validation/view/navigation/notification/notification_screen.dart';
import 'package:e_validation/view/navigation/reward/reward_screen.dart';
import 'package:e_validation/view/navigation/widget/cancel_button_widget.dart';
import 'package:e_validation/view/navigation/widget/delete_button_widget.dart';
import 'package:e_validation/view/navigation/widget/input_email_widget.dart';
import 'package:e_validation/view/navigation/widget/no_button_widget.dart';
import 'package:e_validation/view/navigation/widget/yes_button_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../models/navigation/menu_items_model.dart';
import '../../res/assets/font_assets.dart';
import '../../res/assets/icon_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/componants/MenuIcon.dart';
import '../../res/routes/routes_name.dart';
import '../../view_models/controller/user_preference/user_preference_view_model.dart';

class NavigationScreen extends StatefulWidget {
  final int initialIndex;

  const NavigationScreen({Key? key, this.initialIndex = 0}) : super(key: key);

  // const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
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
  int _selectedIndex = 0;
  final initialIndex = Get.arguments?['initialIndex'] ?? 0;

  @override
  void initState() {
    // _child = HomeScreen();
    super.initState();
    _selectedIndex = widget.initialIndex;
    if (kDebugMode) {
      print(_selectedIndex);
    }
    _setInitialScreen();
  }

  void _setInitialScreen() {
    switch (_selectedIndex) {
      case 0:
        _child = RewardScreen();
        break;
      case 1:
        _child = HistoryScreen();
        break;
      case 2:
        _child = HomeScreen();
        break;
      case 3:
        _child = NotificationScreen();
        break;
      case 4:
        _child = ComplaintsScreen();
        break;
      default:
        _child = RewardScreen();
        break;
    }
  }

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
          backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //   title: Text(''),
          //   leading: Builder(
          //     builder: (context) => IconButton(
          //       icon: Image.asset(IconAssets.ic_menu, width: 24, height: 24),
          //       onPressed: () => Scaffold.of(context).openDrawer(),
          //     ),
          //   ),
          // ),
          // body: _pages[_selectedIndex],
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
                      // SizedBox(height: Get.height * 0.01),
                      Text(
                        'user_name'.tr,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: AppColor.textBlackPrimary,
                            fontSize: 20,
                            fontFamily: FontAssets.poppins_semi_bold),
                      ),
                      Text(
                        'user_email'.tr,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: AppColor.textBlackPrimary,
                            fontSize: 16,
                            fontFamily: FontAssets.poppins_regular),
                      ),
                      // SizedBox(height: Get.height * 0.01),
                    ],
                  ),
                ),
                // SizedBox(height: Get.height * 0.01),
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
          // body: _child,
          body: Stack(
            children: [
              Center(
                child: _child,
              ),
              SafeArea(
                child:
                    Align(alignment: Alignment.topLeft, child: const MenuIcon()
                        // IconButton(
                        //   icon: Image.asset(
                        //     IconAssets.ic_menu,
                        //     width: 24,
                        //     height: 18,
                        //   ),
                        //   onPressed: () => Scaffold.of(context).openDrawer(),
                        // ),
                        ),
              ),
            ],
          ),

          // body: SafeArea(
          //   child: Stack(
          //     children: [
          //       const MenuIcon(),
          //       Center(
          //         child: _child,
          //       ),
          //     ],
          //   ),
          // ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _handleNavigationChange,
            backgroundColor: Colors.transparent,
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
    // Get.back();
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          _child = RewardScreen();
          break;
        case 1:
          _child = HistoryScreen();
          break;
        case 2:
          _child = HomeScreen();
          break;
        case 3:
          _child = NotificationScreen();
          break;
        case 4:
          _child = ComplaintsScreen();
          break;
        default:
          _child = HomeScreen();
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
          _child = ProfileScreen();
          break;
        case 'Redeem':
          // _child = ProfileScreen();
          break;
        case 'KYC':
          _child = KYCScreen();
          break;
        case 'FAQS':
          _child = FAQSScreen();
          break;
        case 'Settings':
          _child = SettingsScreen();
          break;
        case 'Complaints':
          // _child = ProfileScreen();
          break;
        case 'Points':
          // _child = ProfileScreen();
          break;
        case 'Delete Account':
          showDeleteAccountDialog();
          break;
        case 'Logout':
          showLogoutDialog();
          break;
        case 'Scan Product':
          _child = ScanProductScreen();
          break;
        case 'Product Verified':
          _child = ProductVerifiedScreen();
          break;
        case 'Product Detail':
          _child = FAQSScreen();
          break;
        case 'Fake Product':
          _child = FakeProductScreen();
          break;
        case 'Complain':
          _child = ComplainScreen();
          break;
        case 'Product Verify Done':
          _child = ProductVerifyDoneScreen();
          break;
        default:
          _child = HomeScreen();
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
