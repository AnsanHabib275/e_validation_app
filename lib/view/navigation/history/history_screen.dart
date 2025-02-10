import 'package:e_validation/view/navigation/history/widget/history_cart_widget.dart';
import 'package:e_validation/view_models/controller/navigation/history/history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
                    image: AssetImage(ImageAssets.product_detail_bg),
                    fit: BoxFit.cover,
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
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (historyVM.error.isNotEmpty) {
                      return Center(child: Text(historyVM.error.value));
                    }
                    if (historyVM.historyDataList.isEmpty) {
                      return Center(child: Text('no_history'.tr));
                    }
                    return ListView.builder(
                      itemCount: historyVM.historyDataList.length,
                      itemBuilder: (context, index) {
                        return HistoryCartWidget(
                            history: historyVM.historyDataList[index]);
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ));
  }
}
