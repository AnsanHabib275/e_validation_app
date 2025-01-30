import 'package:e_validation/models/navigation/menu/redeem/restaurants_list_model.dart';
import 'package:e_validation/view/navigation/menu/redeem/widget/reward_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../res/assets/font_assets.dart';
import '../../../../../res/assets/image_assets.dart';
import '../../../../../res/colors/app_color.dart';
import '../../../../../utils/utils.dart';

class RestaurantsCardWidget extends StatelessWidget {
  final List<RestaurantsListModel> items;

  const RestaurantsCardWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        height: 168,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                SizedBox(
                  height: 168,
                  width: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              8), // Ensure clipping to the border radius
                          child: Image.asset(
                            items[index].imagePath,
                            // Replace with the path to your SVG file
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(5)),
                      Text(
                        items[index].description,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            color: AppColor.textBlackPrimary),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width * Utils.getResponsiveWidth(10),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
