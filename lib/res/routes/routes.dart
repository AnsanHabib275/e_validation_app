import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view/account_created/account_created_screen.dart';
import 'package:e_validation/view/forget_password/forget_password_screen.dart';
import 'package:e_validation/view/navigation/home/product/QRScannnerScreen.dart';
import 'package:e_validation/view/navigation/home/product/fake_product_screen.dart';
import 'package:e_validation/view/navigation/home/product/product_detail_screen.dart';
import 'package:e_validation/view/navigation/home/product/product_verified_screen.dart';
import 'package:e_validation/view/navigation/home/product/product_verify_done_screen.dart';
import 'package:e_validation/view/navigation/menu/faqs/faqs_screen.dart';
import 'package:e_validation/view/navigation/menu/kyc/kyc_screen.dart';
import 'package:e_validation/view/navigation/menu/points/points_screen.dart';
import 'package:e_validation/view/navigation/menu/profile/profile_screen.dart';
import 'package:e_validation/view/navigation/menu/redeem/redeem_reward_screen.dart';
import 'package:e_validation/view/navigation/menu/settings/settings_screen.dart';
import 'package:e_validation/view/navigation/menu/settings/update_profile_screen.dart';
import 'package:e_validation/view/navigation/menu/voice_chat_gpt/voice_chat_gpt_screen.dart';
import 'package:e_validation/view/navigation/menu/vouchers/vouchers_screen.dart';
import 'package:e_validation/view/navigation/reward/reward_screen.dart';
import 'package:e_validation/view/reset_password/reset_password_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../view/login/login_screen.dart';
import '../../view/navigation/complaints/complaints_screen.dart';
import '../../view/navigation/history/history_screen.dart';
import '../../view/navigation/home/home_screen.dart';
import '../../view/navigation/home/product/complain_screen.dart';
import '../../view/navigation/home/product/scan_product_screen.dart';
import '../../view/navigation/menu/not_eligible/not_eligible_screen.dart';
import '../../view/navigation/navigation_screen.dart';
import '../../view/navigation/notification/notification_screen.dart';
import '../../view/signup/sign_up_screen.dart';
import '../../view/splash/splash_screen.dart';
import '../../view/splash/splash_screen_two.dart';
import '../../view/splash/welcome_screen.dart';
import '../../view/verifyEmail/verify_email_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashScreen,
          page: () => SplashScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.splashScreenTwo,
          page: () => SplashScreenTwo(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.downToUp,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.welcomeScreen,
          page: () => WelcomeScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.loginScreen,
          page: () => LoginScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.signUpScreen,
          page: () => SignUpScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.accountCreatedScreen,
          page: () => AccountCreatedScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.navigationScreen,
          page: () => NavigationScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.rewardScreen,
          page: () => RewardScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.historyScreen,
          page: () => HistoryScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.homeScreen,
          page: () => HomeScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.notificationScreen,
          page: () => NotificationScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.complaintsScreen,
          page: () => ComplaintsScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.scanProductScreen,
          page: () => ScanProductScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.productVerifiedScreen,
          page: () => ProductVerifiedScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.productVerifyDoneScreen,
          page: () => ProductVerifyDoneScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.productDetailScreen,
          page: () => ProductDetailScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.fakeProductScreen,
          page: () => FakeProductScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.complainScreen,
          page: () => ComplainScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.notEligibleScreen,
          page: () => NotEligibleScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.profileScreen,
          page: () => ProfileScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.kycScreen,
          page: () => KYCScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.faqsScreen,
          page: () => FAQSScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.settingsScreen,
          page: () => SettingsScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.redeemRewardScreen,
          page: () => RedeemRewardScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.pointsScreen,
          page: () => PointsScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.vouchersScreen,
          page: () => VouchersScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.verifyEmailScreen,
          page: () => VerifyEmailScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.forgetPasswordScreen,
          page: () => ForgetPasswordScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.resetPasswordScreen,
          page: () => ResetPasswordScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.qrScannerScreen,
          page: () => QRScannerScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.voiceChatGptScreen,
          page: () => VoiceChatGptScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
        GetPage(
          name: RoutesName.updateProfileScreen,
          page: () => UpdateProfileScreen(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
          curve: Curves.easeInOut,
        ),
      ];
}
