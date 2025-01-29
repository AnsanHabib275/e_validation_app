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
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../models/navigation/menu_items_model.dart';
import '../../res/assets/font_assets.dart';
import '../../res/assets/icon_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/componants/MenuIcon.dart';
import '../../view_models/controller/user_preference/user_preference_view_model.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final navigationVM = Get.put(NavigationViewModel());
  final _formkey = GlobalKey<FormState>();

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

  String? eid = '';

  Future<void> getUserDetail() async {
    UserPreference userPreference = UserPreference();
    userPreference.getUser().then((user) {
      setState(() {
        eid = user.user?.eID;
      });
    });
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //       statusBarColor: Colors.white,
  //       statusBarIconBrightness: Brightness.dark,
  //       systemNavigationBarColor: Colors.white,
  //       systemNavigationBarIconBrightness: Brightness.dark));
  // }

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: () {
    //     FocusScope.of(context).unfocus();
    //   },
    //   child: Scaffold(
    //     extendBody: true,
    //     drawer: Drawer(
    //       child: ListView(
    //         children: [
    //           Container(
    //             height: Get.height * Utils.getResponsiveHeight(200),
    //             child: DrawerHeader(
    //               margin: EdgeInsets.zero,
    //               padding: EdgeInsets.zero,
    //               child: Stack(fit: StackFit.expand, children: [
    //                 Positioned(
    //                     top: 0,
    //                     right: Get.width * Utils.getResponsiveWidth(10),
    //                     child: InkWell(
    //                         onTap: () {
    //                           Get.back();
    //                         },
    //                         child:
    //                             SvgPicture.asset(IconAssets.ic_close_circle))),
    //                 Positioned(
    //                   left: Get.width * Utils.getResponsiveWidth(20),
    //                   top: Get.height * Utils.getResponsiveHeight(26),
    //                   right: Get.width * Utils.getResponsiveWidth(20),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       CircleAvatar(
    //                         radius: Get.height * Utils.getResponsiveSize(40),
    //                         backgroundColor: AppColor.lightGreyColor,
    //                         backgroundImage:
    //                             AssetImage(ImageAssets.dummy_profile),
    //                       ),
    //                       Text(
    //                         'George Oliver',
    //                         textAlign: TextAlign.start,
    //                         style: TextStyle(
    //                             color: AppColor.textBlack80Per,
    //                             fontSize:
    //                                 Get.height * Utils.getResponsiveSize(20),
    //                             fontFamily: 'Poppins',
    //                             fontWeight: FontWeight.w600),
    //                       ),
    //                       Text(
    //                         'Georgeoliver@gmail.com',
    //                         textAlign: TextAlign.start,
    //                         maxLines: 1,
    //                         overflow: TextOverflow.ellipsis,
    //                         style: TextStyle(
    //                             color: AppColor.textBlack80Per,
    //                             fontSize:
    //                                 Get.height * Utils.getResponsiveSize(16),
    //                             fontFamily: 'Poppins',
    //                             fontWeight: FontWeight.w400),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ]),
    //             ),
    //           ),
    //           ...items.asMap().entries.map((entry) {
    //             int index = entry.key;
    //             MenuItemsModel item = entry.value;
    //             return Column(
    //               children: [
    //                 ListTile(
    //                   leading:
    //                       Image.asset(item.imagePath, width: 30, height: 30),
    //                   title: Text(
    //                     item.name,
    //                     style: TextStyle(
    //                         fontFamily: 'Poppins',
    //                         fontWeight: FontWeight.w500,
    //                         fontSize: Get.height * Utils.getResponsiveSize(18),
    //                         color: AppColor.textBlack80Per),
    //                   ),
    //                   onTap: () {
    //                     _handleDrawerNavigationChange(item.name);
    //                   },
    //                 )
    //               ],
    //             );
    //           }).toList()
    //         ],
    //       ),
    //     ),
    //     body: Stack(
    //       children: [
    //         Center(
    //           child: Obx(() => navigationVM.currentScreen.value ?? SizedBox()),
    //         ),
    //         SafeArea(
    //           top: false,
    //           child: Stack(
    //             children: [
    //               Positioned(
    //                   top: Get.height * Utils.getResponsiveHeight(60),
    //                   left: 0,
    //                   right: 0,
    //                   child: Divider(
    //                     height: Get.height * Utils.getResponsiveHeight(1),
    //                     thickness: 1,
    //                     color: AppColor.textBlack10Per,
    //                   )),
    //               Positioned(
    //                   top: Get.height * Utils.getResponsiveHeight(60),
    //                   left: 0,
    //                   child: const MenuIcon()),
    //             ],
    //           ),
    //           // child: const MenuIcon(),
    //         ),
    //       ],
    //     ),
    //     bottomNavigationBar: BottomNavigationBar(
    //       onTap: _handleNavigationChange,
    //       elevation: 0,
    //       items: [
    //         BottomNavigationBarItem(
    //             backgroundColor: Colors.transparent,
    //             icon: Image.asset(IconAssets.ic_bn_reward),
    //             label: ''),
    //         BottomNavigationBarItem(
    //             icon: Image.asset(IconAssets.ic_bn_history), label: ''),
    //         BottomNavigationBarItem(
    //             icon: Image.asset(IconAssets.ic_bn_home), label: ''),
    //         BottomNavigationBarItem(
    //             icon: Image.asset(IconAssets.ic_bn_notification), label: ''),
    //         BottomNavigationBarItem(
    //             icon: Image.asset(IconAssets.ic_bn_complaint), label: ''),
    //       ],
    //     ),
    //   ),
    // );
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
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            extendBody: true,
            drawer: Drawer(
              child: ListView(
                children: [
                  Container(
                    height: Get.height * Utils.getResponsiveHeight(200),
                    child: DrawerHeader(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      child: Stack(fit: StackFit.expand, children: [
                        Positioned(
                            top: 0,
                            right: Get.width * Utils.getResponsiveWidth(10),
                            child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: SvgPicture.asset(
                                    IconAssets.ic_close_circle))),
                        Positioned(
                          left: Get.width * Utils.getResponsiveWidth(20),
                          top: Get.height * Utils.getResponsiveHeight(26),
                          right: Get.width * Utils.getResponsiveWidth(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius:
                                    Get.height * Utils.getResponsiveSize(40),
                                backgroundColor: AppColor.lightGreyColor,
                                backgroundImage:
                                    AssetImage(ImageAssets.dummy_profile),
                              ),
                              Text(
                                'George Oliver',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: AppColor.textBlack80Per,
                                    fontSize: Get.height *
                                        Utils.getResponsiveSize(20),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Georgeoliver@gmail.com',
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppColor.textBlack80Per,
                                    fontSize: Get.height *
                                        Utils.getResponsiveSize(16),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                  ...items.asMap().entries.map((entry) {
                    int index = entry.key;
                    MenuItemsModel item = entry.value;
                    return Column(
                      children: [
                        ListTile(
                          leading: Image.asset(item.imagePath,
                              width: 30, height: 30),
                          title: Text(
                            item.name,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(18),
                                color: AppColor.textBlack80Per),
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
                  top: false,
                  child: Stack(
                    children: [
                      Positioned(
                          top: Get.height * Utils.getResponsiveHeight(60),
                          left: 0,
                          right: 0,
                          child: Divider(
                            height: Get.height * Utils.getResponsiveHeight(1),
                            thickness: 1,
                            color: AppColor.textBlack10Per,
                          )),
                      Positioned(
                          top: Get.height * Utils.getResponsiveHeight(60),
                          left: 0,
                          child: const MenuIcon()),
                    ],
                  ),
                  // child: const MenuIcon(),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: _handleNavigationChange,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Colors.transparent,
                    icon: Image.asset(IconAssets.ic_bn_reward),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Image.asset(IconAssets.ic_bn_history), label: ''),
                BottomNavigationBarItem(
                    icon: Image.asset(IconAssets.ic_bn_home), label: ''),
                BottomNavigationBarItem(
                    icon: Image.asset(IconAssets.ic_bn_notification),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Image.asset(IconAssets.ic_bn_complaint), label: ''),
              ],
            ),
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
          navigationVM.changeScreen(ComplaintsScreen());
          break;
        case 'Points':
          // navigationVM.changeScreen(RedeemRewardScreen());
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
          borderRadius: BorderRadius.circular(
              Get.height * Utils.getResponsiveSize(12)), // Rounded corners
        ),
        elevation: 4, // White background
        child: SizedBox(
          height: Get.height * Utils.getResponsiveHeight(364),
          width: Get.width * Utils.getResponsiveWidth(368),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(20),
                vertical: Get.height * Utils.getResponsiveHeight(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // Center alignment
              children: [
                Image.asset(
                  height: Get.height * Utils.getResponsiveHeight(52),
                  width: Get.width * Utils.getResponsiveWidth(39),
                  ImageAssets.img_delete,
                ),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(22),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * Utils.getResponsiveWidth(16)),
                  child: Form(key: _formkey, child: InputEmailWidget()),
                ),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(17),
                ),
                FittedBox(
                  child: Text(
                    'are_you_sure_you_want_to_delete'.tr,
                    textAlign: TextAlign.center,
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: Get.height * Utils.getResponsiveSize(16),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: AppColor.textBlack80Per),
                  ),
                ),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(32),
                ),
                // Quantity Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DeleteButtonWidget(
                      formkey: _formkey,
                      eid: eid,
                    ),
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
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              Get.height * Utils.getResponsiveSize(12)), // Rounded corners
        ),
        child: SizedBox(
          height: Get.height * Utils.getResponsiveHeight(301),
          width: Get.width * Utils.getResponsiveWidth(368),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(20),
                vertical: Get.height * Utils.getResponsiveHeight(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // Center alignment
              children: [
                SvgPicture.asset(
                  height: Get.height * Utils.getResponsiveHeight(69),
                  width: Get.width * Utils.getResponsiveWidth(69),
                  ImageAssets.img_logout,
                ),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(30),
                ),
                FittedBox(
                  child: Text(
                    'are_you_sure_you_want_to_logout'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        // fontSize: Get.width * Utils.getResponsiveSize(16),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: AppColor.textBlack80Per),
                  ),
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
                    SizedBox(width: Get.width * Utils.getResponsiveWidth(5)),
                    NoButtonWidget(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
