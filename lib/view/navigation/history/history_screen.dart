import 'package:e_validation/models/navigation/history/scan_history_model.dart';
import 'package:e_validation/view/navigation/history/widget/history_cart_widget.dart';
import 'package:e_validation/view_models/controller/navigation/history/history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../models/navigation/history_list_model.dart';
import '../../../res/assets/font_assets.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final historyVM = Get.put(HistoryViewModel());

  @override
  void initState() {
    super.initState();
    historyVM.historyListApi();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          body: Column(
            children: [
              Container(
                width: Get.width * Utils.getResponsiveWidth(428),
                height: Get.height * Utils.getResponsiveHeight(365),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageAssets
                        .product_detail_bg), // Replace with your image path
                    fit: BoxFit.cover, // Adjust the image to fill the screen
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: Get.height * Utils.getResponsiveHeight(87)),
                      child: SvgPicture.asset(
                        ImageAssets.img_history,
                        height: Get.height * Utils.getResponsiveHeight(193),
                        width: Get.width * Utils.getResponsiveWidth(235),
                      ),
                    ),
                    SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16)),
                    Text(
                      'history'.tr,
                      style: TextStyle(
                          color: AppColor.textColorPrimary,
                          fontSize: Get.height * Utils.getResponsiveSize(26),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Get.width * Utils.getResponsiveWidth(16),
                      right: Get.width * Utils.getResponsiveWidth(16),
                      bottom: Get.height * Utils.getResponsiveHeight(70)),
                  child: Obx(() {
                    if (historyVM.loading.value) {
                      print('loading');
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (historyVM.error.isNotEmpty) {
                      print('error');
                      return Center(child: Text(historyVM.error.value));
                    }
                    // if (historyVM.scanHistoryList.isEmpty) {
                    //   print('empty');
                    //   return Center(child: Text('No History'));
                    // }

                    return ListView.builder(
                      itemCount: historyVM.historyDataList.length,
                      itemBuilder: (context, index) {
                        final item = historyVM.historyDataList[index];
                        return HistoryCartWidget(history: item);
                      },
                    );
                  }),
                  // child: FutureBuilder<List<Data>>(
                  //   future: historyVM.historyListApi(), // Call your function
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return Center(
                  //           child:
                  //               CircularProgressIndicator()); // Loading indicator
                  //     } else if (snapshot.hasError) {
                  //       return Center(
                  //           child: Text(
                  //               'Error: ${snapshot.error}')); // Error message
                  //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  //       return Center(
                  //           child:
                  //               Text('your_cart_is_empty'.tr)); // Empty state
                  //     } else {
                  //       // final histories = snapshot.data!;
                  //       final List<Data> histories = snapshot.data!;
                  //       return SizedBox(
                  //         child: ListView.builder(
                  //           scrollDirection: Axis.vertical,
                  //           itemCount: histories.length,
                  //           itemBuilder: (context, index) {
                  //             final history = histories[index];
                  //             return HistoryCartWidget(
                  //               history: history,
                  //             );
                  //           },
                  //         ),
                  //       );
                  //     }
                  //   },
                  // ),
                ),
              ),
            ],
          ),
        ));
  }
}
