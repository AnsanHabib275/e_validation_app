import 'package:e_validation/models/navigation/menu/points/points_list_model.dart';
import 'package:e_validation/models/navigation/menu/vouchers/vouchers_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../res/colors/app_color.dart';
import '../../../../../utils/utils.dart';
import '../../../../../view_models/controller/navigation/navigation_view_model.dart';
import '../vouchers_screen.dart';

class VouchersCardWidget extends StatelessWidget {
  final VouchersListModel items;

  VouchersCardWidget({super.key, required this.items});

  final navigationVM = Get.put(NavigationViewModel());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: InkWell(
            onTap: () {
              navigationVM.changeScreen(VouchersScreen());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0)),
                        // Ensure clipping to the border radius
                        child: Image.asset(
                          items.imagePath,
                          // Replace with the path to your SVG file
                          fit: BoxFit.cover,
                        ),
                      ),
                      Transform.rotate(
                        angle: 30 * (3.141592653589793 / 180),
                        child: Text(
                          items.imageName,
                          style: GoogleFonts.alexBrush(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            color: AppColor.textWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, top: 16.0, right: 16.0, bottom: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                items.voucherName,
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.textBlackPrimary),
                              ),
                              Text(
                                items.specialty,
                                style: GoogleFonts.alexBrush(
                                  color: AppColor.textOrangePrimary,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            items.price,
                            style: GoogleFonts.abrilFatface(
                              color: AppColor.colorPrimary,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(10),
                      ),
                      Text(
                        items.detail,
                        style: GoogleFonts.poppins(
                          color: AppColor.textBlackPrimary,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(34),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'voucher_#',
                            style: GoogleFonts.poppins(
                              color: AppColor.textBlackPrimary,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ),
                          Spacer(),
                          Text(
                            items.voucherNumber,
                            style: GoogleFonts.poppins(
                              color: AppColor.textBlackPrimary,
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(8),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'valid_unit',
                            style: GoogleFonts.poppins(
                              color: AppColor.textBlackPrimary,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ),
                          Spacer(),
                          Text(
                            items.validFor,
                            style: GoogleFonts.poppins(
                              color: AppColor.textBlackPrimary,
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
    //   Padding(
    //   padding: const EdgeInsets.only(left: 16.0, right: 16.0),
    //   child: SizedBox(
    //     height: 203,
    //     child: ListView.builder(
    //       scrollDirection: Axis.vertical,
    //       itemCount: items.length,
    //       itemBuilder: (context, index) {
    //         return
    //       },
    //     ),
    //   ),
    // );
  }
}
