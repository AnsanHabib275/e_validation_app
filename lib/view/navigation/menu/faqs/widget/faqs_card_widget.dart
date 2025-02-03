import 'package:e_validation/models/navigation/menu/faqs/faqs_list_model.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_color.dart';

class FaqsCardWidget extends StatelessWidget {
  final FaqsListModel faqs;

  const FaqsCardWidget({super.key, required this.faqs});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ExpandableNotifier(
        child: Padding(
          padding:
              EdgeInsets.only(top: Get.height * Utils.getResponsiveHeight(14)),
          child: ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: false,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
                hasIcon: true,
              ),
              header: Padding(
                padding: EdgeInsets.only(
                    left: Get.width * Utils.getResponsiveWidth(14)),
                child: Text(
                  faqs.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: Get.height * Utils.getResponsiveSize(13),
                      color: AppColor.textGreyPrimary),
                ),
              ),
              collapsed: const Text(
                "",
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(
                        Get.height * Utils.getResponsiveHeight(10)),
                    child: Text(
                      faqs.heading,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: Get.height * Utils.getResponsiveSize(20),
                          color: AppColor.textGreyPrimary),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        Get.height * Utils.getResponsiveHeight(10)),
                    child: Text(
                      faqs.description,
                      softWrap: true,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: Get.height * Utils.getResponsiveSize(12),
                          color: AppColor.textGreyPrimary),
                    ),
                  ),
                  Divider(
                    height: Get.height * Utils.getResponsiveHeight(1),
                    thickness: 1,
                    color: AppColor.textBlack10Per,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Builder(
                      builder: (context) {
                        var controller =
                            ExpandableController.of(context, required: true)!;
                        return TextButton(
                          child: Text(
                            controller.expanded ? 'ok'.tr : "?",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                color: AppColor.textColorPrimary),
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
