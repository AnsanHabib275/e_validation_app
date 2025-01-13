// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, camel_case_types, unused_local_variable, avoid_print, prefer_typing_uninitialized_variables, unused_field, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_element, body_might_complete_normally_nullable, avoid_unnecessary_containers, unrelated_type_equality_checks, unnecessary_string_interpolations
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../../../models/scan_data_model.dart';

class appscan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: qrScan(
        title: 'Validatione QR Reader',
      ),
    );
  }
}

class qrScan extends StatefulWidget {
  const qrScan({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _qrScanState createState() => _qrScanState();
}

SharedPreferences? prefs;
String? eid;

class _qrScanState extends State<qrScan> with SingleTickerProviderStateMixin {
  String? _qrInfo = 'Scan a QR/Bar code';
  bool _camState = false;

  late AnimationController controller;
  double controllers = 9;

  Scanmodel? model;
  String? productid;
  String? originalString;
  String? modifiedString;

  _qrCallback(code) {
    setState(() {
      _camState = false;
      _qrInfo = code;
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  getSharePrefenceValue() async {
    prefs = await SharedPreferences.getInstance();
    String? getEmail = prefs!.getString('eid').toString();

    setState(() {
      eid = getEmail;
    });

    log(eid.toString());
  }

  String formatDate(String dateTime) {
    // Splitting the string at 'T' and taking the first part which is the date
    return dateTime.split('T')[0];
  }

  @override
  void initState() {
    super.initState();
    getSharePrefenceValue();
    _scanCode();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        backgroundColor: AppColor.textColorPrimary,
        title: Text(
          widget.title!,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _camState
          ? Center(
              child: SizedBox(
                height: 1000,
                width: 500,
                child: QRBarScannerCamera(
                    onError: (context, error) => Text(
                          error.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                    qrCodeCallback: (code) async {
                      _qrCallback(code);

                      originalString = code;
                      modifiedString = originalString!
                          .substring(2, originalString!.length - 2);
                      // log(modifiedString!.toString());

                      final Scanmodel? scanmodel =
                          await scandataapi(modifiedString.toString());

                      if (scanmodel != null) {
                        setState(() {
                          model = scanmodel;
                          controllers == 10;
                        });
                      } else {}
                    }),
              ),
            )
          : Center(
              child: controllers == 10
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Lottie.asset('assets/lottie/loadertick.json',
                              repeat: false,
                              controller: controller,
                              height: 300, onLoaded: (composition) {
                            controller.forward();
                            Future.delayed(const Duration(seconds: 3), () {
                              setState(() {
                                controllers = 11;
                              });
                            });
                          }),
                        ),
                      ],
                    )
                  : model == null
                      ? Container(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  width: 150.0, // Adjust the width as needed
                                  height: 30.0, // Adjust the height as needed
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.grey[300],
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                const Text(
                                  'Loading Data',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            // child: Shimmer.fromColors(
                            //   baseColor: Colors.grey[300]!,
                            //   highlightColor: Colors.grey[100]!,
                            //   child: Column(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: <Widget>[
                            //       Container(
                            //         width: 150.0, // Adjust the width as needed
                            //         height: 30.0, // Adjust the height as needed
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(8.0),
                            //           color: Colors.grey[300],
                            //         ),
                            //       ),
                            //       const SizedBox(height: 8.0),
                            //       const Text(
                            //         'Loading Data',
                            //         style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //           color: Colors.grey,
                            //           fontFamily: "Poppins",
                            //           fontSize: 16,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ),
                        )
                      : controllers == 9
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Lottie.asset(
                                      'assets/lottie/loadertick.json',
                                      repeat: false,
                                      controller: controller,
                                      height: 300, onLoaded: (composition) {
                                    controller.forward();
                                    Future.delayed(const Duration(seconds: 3),
                                        () {
                                      setState(() {
                                        controllers = 101;
                                      });
                                    });
                                  }),
                                ),
                              ],
                            )
                          : SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: Get.height * 0.35,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                ImageAssets.splash_bg),
                                            fit: BoxFit.fill)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: Get.height * 0.02)),
                                        ClipRRect(
                                          child: Image.network(
                                            "https://validatione.com" +
                                                "${model?.data!.productImageUrl1}",
                                            height: Get.height * 0.16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.height * 0.02,
                                            vertical: Get.height * 0.01),
                                        child: cryptoChange(),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.03,
                                    ),
                                    child: Card(
                                      elevation: 2.24,
                                      child: Column(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Get.width * 0.03,
                                                      vertical:
                                                          Get.height * 0.01),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Row(
                                                      children: <Widget>[
                                                        RichText(
                                                            text:
                                                                const TextSpan(
                                                          text: "Product Name",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 16),
                                                        )),
                                                        const Spacer(), // use Spacer
                                                        RichText(
                                                            text: TextSpan(
                                                          text:
                                                              "${model?.data?.productName}",
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 14),
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Get.width * 0.03,
                                                      vertical:
                                                          Get.height * 0.01),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Row(
                                                      children: <Widget>[
                                                        RichText(
                                                            text:
                                                                const TextSpan(
                                                          text: "Scan Count",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 16),
                                                        )),
                                                        const Spacer(), // use Spacer
                                                        RichText(
                                                            text: TextSpan(
                                                          text:
                                                              "${model?.data?.scanCount.toString()}",
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 14),
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Get.width * 0.03,
                                                      vertical:
                                                          Get.height * 0.01),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Row(
                                                      children: <Widget>[
                                                        RichText(
                                                            text:
                                                                const TextSpan(
                                                          text: "Barcode ",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 16),
                                                        )),
                                                        const Spacer(), // use Spacer
                                                        RichText(
                                                            text:
                                                                const TextSpan(
                                                          text: "----",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 14),
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Get.width * 0.03,
                                                      vertical:
                                                          Get.height * 0.01),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Row(
                                                      children: <Widget>[
                                                        RichText(
                                                            text:
                                                                const TextSpan(
                                                          text: "Product SKU",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 16),
                                                        )),
                                                        const Spacer(), // use Spacer
                                                        RichText(
                                                            text:
                                                                const TextSpan(
                                                          text: "----",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 14),
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Get.width * 0.03,
                                                      vertical:
                                                          Get.height * 0.01),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Row(
                                                      children: <Widget>[
                                                        RichText(
                                                            text:
                                                                const TextSpan(
                                                          text: "Supplier",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 16),
                                                        )),
                                                        const Spacer(), // use Spacer
                                                        RichText(
                                                            text:
                                                                const TextSpan(
                                                          text: "----",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 14),
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Get.width * 0.03,
                                                      vertical:
                                                          Get.height * 0.01),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Row(
                                                      children: <Widget>[
                                                        RichText(
                                                            text:
                                                                const TextSpan(
                                                          text: "Created at",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 16),
                                                        )),
                                                        const Spacer(), // use Spacer
                                                        RichText(
                                                            text: TextSpan(
                                                          text: formatDate(
                                                              "${model?.data?.productCreatedDateTime.toString()}"),
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 14),
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Get.width * 0.03,
                                                      vertical:
                                                          Get.height * 0.01),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Row(
                                                      children: <Widget>[
                                                        RichText(
                                                            text:
                                                                const TextSpan(
                                                          text: "Expiry Date",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 16),
                                                        )),
                                                        const Spacer(), // use Spacer
                                                        RichText(
                                                            text: TextSpan(
                                                          text: model?.data
                                                                      ?.productExpiryDate !=
                                                                  null
                                                              ? formatDate(
                                                                  "${model!.data!.productExpiryDate.toString()}")
                                                              : "No date provided", // Fallback text in case of null
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 14),
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.040,
                                      vertical: Get.height * 0.035,
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColor.textColorPrimary,
                                        padding: const EdgeInsets.only(
                                            bottom: 18, top: 18),
                                        minimumSize: const Size.fromHeight(10),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12), // Custom radius
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        "  Done  ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins",
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
            ),
    );
  }

  Future<Scanmodel?> scandataapi(String code) async {
    var id = {"productHash": code, "deviceIp": "", "deviceIdentity": ""};
    var body = jsonEncode(id);
    var urlparse = Uri.parse("https://VLD-API-v1.beweb3.com/api/ScanProduct/");
    var response = await http.post(urlparse, body: body, headers: {
      "Content-Type": "application/json",
      'E_ID': eid.toString(),
    });

    print('Response Status Code: ${response.statusCode}');
    log(response.body.toString());

    if (response.statusCode == 200) {
      var dataa = jsonDecode(response.body);
      bool check = dataa["IsSuccessfull"];
      if (check) {
        print('Status Code 200 and isSuccessfull is true');
        return scanmodelFromJson(response.body);
      } else {
        return null; // You might want to handle this case as well
      }
    } else if (response.statusCode == 400) {
      var responseBody =
          jsonDecode(response.body); // Correctly decode the response body
      String scanCount = responseBody['ScanCount'] ?? '0';

      String productid = responseBody['ProductId'] ?? '---';
      Get.toNamed(RoutesName.complainScreen, arguments: {
        code: code.toString(),
        productid: productid,
        scanCount: scanCount,
      });
      // Navigator.pushReplacement(
      //   context,
      // MaterialPageRoute(
      //   builder: (context) => errorcomplain(
      //     code: code.toString(),
      //     productid: productid,
      //     scancount: scanCount,
      //   ),
      // ),
      // );
      return null;
    } else {
      Fluttertoast.showToast(msg: 'This QR Doesnt Belong to E-Validation');
      // AppNavigatorService.pushNamed(Route_paths.home);
      return null;
    }
  }
}

Widget cryptoChange() {
  return const Align(
    alignment: Alignment.topLeft,
    child: Column(children: [
      Text(
        "Product Details",
        style: TextStyle(
            color: AppColor.textColorPrimary,
            fontSize: 24,
            fontWeight: FontWeight.w800,
            fontFamily: "Poppins"),
      ),
    ]),
  );
}
