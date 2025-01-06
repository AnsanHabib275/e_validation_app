import 'package:e_validation/models/navigation/menu/points/points_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../res/colors/app_color.dart';
import '../../../../../utils/utils.dart';

class PointsCardWidget extends StatelessWidget {
  final List<PointsListModel> items;

  const PointsCardWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        height: 132,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                SizedBox(
                  height: 132,
                  width: 94,
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
                          height: Get.height * Utils.getResponsiveHeight(8)),
                      Text(
                        items[index].name,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: AppColor.textBlack80Per),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        items[index].price,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColor.textBlack80Per,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
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
