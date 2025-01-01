import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../models/navigation/menu/redeem/transportation_list_model.dart';
import '../../../../../res/colors/app_color.dart';
import '../../../../../utils/utils.dart';

class TransportationCardWidget extends StatelessWidget {
  final List<TransportationListModel> items;

  const TransportationCardWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        height: 190,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                SizedBox(
                  height: 190,
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
                      SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(2)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            items[index].points,
                            style: TextStyle(
                              color: AppColor.textColorPrimary,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * Utils.getResponsiveWidth(5),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height:
                                  Get.height * Utils.getResponsiveHeight(18),
                              width: Get.width * Utils.getResponsiveWidth(45),
                              decoration: BoxDecoration(
                                color: items[index] == 1
                                    ? AppColor.colorPrimary
                                    : AppColor.lightGreyButtonColor,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Center(
                                child: Text(
                                  items[index].buttonName,
                                  style: TextStyle(
                                      color: items[index] == 1
                                          ? AppColor.whiteColor
                                          : AppColor.textGreyPrimary,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Poppins',
                                      fontSize: 6),
                                ),
                              ),
                            ),
                          ),
                        ],
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
