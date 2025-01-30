import 'package:e_validation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:get/get.dart';

class FaqsCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ExpandableNotifier(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Get.height * Utils.getResponsiveHeight(14)),
          child: ScrollOnExpand(
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
                hasIcon: true,
              ),
              header: Padding(
                padding: EdgeInsets.only(
                    left: Get.width * Utils.getResponsiveWidth(14)),
                child: Text("What is KYC?",
                    style: TextStyle(fontFamily: "Poppins")),
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
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Know Your Customer",
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Redeem points content goes here.",
                      softWrap: true,
                    ),
                  ),
                  const Divider(height: 1),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Builder(
                      builder: (context) {
                        var controller =
                            ExpandableController.of(context, required: true)!;
                        return TextButton(
                          child: Text(controller.expanded ? "Ok" : "?",
                              style: const TextStyle(
                                color:
                                    Colors.blue, // Replace with desired color
                                fontSize: 16,
                              )),
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
