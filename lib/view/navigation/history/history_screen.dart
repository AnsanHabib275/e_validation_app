import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          body: Column(
            children: [
              Container(
                width: Get.width * Utils.getResponsiveWidth(428),
                height: Get.height * Utils.getResponsiveHeight(300),
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
                      ImageAssets.img_history,
                      height: Get.height * Utils.getResponsiveHeight(193),
                      width: Get.width * Utils.getResponsiveWidth(235),
                    ),
                    SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16)),
                    Text(
                      'history'.tr,
                      style: TextStyle(
                          color: AppColor.textColorPrimary,
                          fontSize: 26,
                          fontFamily: FontAssets.poppins_semi_bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: FutureBuilder<List<HistoryListModel>>(
                    future: historyVM.cartListApi(), // Call your function
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child:
                                CircularProgressIndicator()); // Loading indicator
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                'Error: ${snapshot.error}')); // Error message
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                            child:
                                Text('your_cart_is_empty'.tr)); // Empty state
                      } else {
                        final carts = snapshot.data!;
                        items = carts.length;
                        grandSubTotal = carts.fold(0.0,
                            (sum, item) => sum + (item.price * item.quantity));
                        return SizedBox(
                          height: 90,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: carts.length,
                            itemBuilder: (context, index) {
                              final cart = carts[index];
                              return CartWidget(
                                cart: cart,
                                onItemDeleted: _refreshCartItems,
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
