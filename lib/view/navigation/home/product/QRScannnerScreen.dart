import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view_models/controller/scanProduct/scan_product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../../../view_models/controller/user_preference/user_preference_view_model.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final scanProductVM = Get.put(ScanProductViewModel());
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isCameraEnabled = false;
  String? eid = '';
  String scannedData = '';

  Future<void> getUserDetail() async {
    UserPreference userPreference = UserPreference();
    userPreference.getUser().then((user) {
      setState(() {
        eid = user.user?.eID;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // _checkCameraPermission();
    // _handleCameraPermission();
    requestCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    final status = await Permission.camera.request();
    print(status);
    if (status.isGranted) {
      setState(() {
        isCameraEnabled = true;
      });
    } else {
      setState(() {
        isCameraEnabled = false;
      });
      // Handle camera permission denied scenario
    }
  }

  Future<void> _handleCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    print(status);
    if (status.isGranted) {
      // Camera permission is already granted
      print("Camera permission granted");
      setState(() {
        isCameraEnabled = true;
      });
      // Open camera or scanner here
    } else if (status.isDenied) {
      // Request camera permission
      PermissionStatus requestStatus = await Permission.camera.request();
      print(requestStatus);
      if (requestStatus.isGranted) {
        print("Camera permission granted");
        setState(() {
          isCameraEnabled = true;
        });
        // Open camera or scanner here
      } else {
        print("Camera permission denied");
        setState(() {
          isCameraEnabled = false;
        });
        _showSettingsDialog();
      }
    } else if (status.isPermanentlyDenied) {
      // Redirect user to app settings to enable the camera
      setState(() {
        isCameraEnabled = false;
      });
      _showSettingsDialog();
    }
  }

  Future<void> requestCameraPermission() async {
    var status = await Permission.camera.status;

    if (status.isDenied || status.isRestricted) {
      // Request the permission again
      status = await Permission.camera.request();
    }

    if (status.isPermanentlyDenied) {
      // Permission is permanently denied, show dialog to guide the user
      openAppSettingsDialog();
    } else if (status.isGranted) {
      print("Camera permission granted!");
      // Proceed with using the camera
    } else {
      print("Camera permission denied!");
    }
  }

  void openAppSettingsDialog() {
    print("Opening settings");
    Permission.camera.isPermanentlyDenied.then((result) {
      // Permission.camera.openSettingIf();
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isCameraEnabled
            ? Stack(
                children: [
                  // QR Scanner
                  // QRView(
                  //   key: qrKey,
                  //   onQRViewCreated: _onQRViewCreated,
                  //   overlay: QrScannerOverlayShape(
                  //     borderColor: Colors.black,
                  //     borderRadius: 10,
                  //     borderLength: 30,
                  //     borderWidth: 5,
                  //     cutOutSize: 300, // Adjust size as needed
                  //   ),
                  // ),
                  Column(
                    children: [
                      Expanded(
                        child: MobileScanner(
                          onDetect: (barcode) {
                            final String? code =
                                barcode.raw.toString(); // Extract scanned data
                            // final String? code = barcode.raw.toString(); // Extract scanned data
                            // barcode.rawValue; // Extract scanned data
                            // handleQrScan(
                            //     barcode.raw.toString() as Map<String, dynamic>);
                            // String rawValue = code['data'][0]['rawValue'] ?? '';
                            if (code != null) {
                              setState(() {
                                scannedData = code;
                              });
                              // Optionally navigate or display product info
                              print("Scanned QR Code: $code");
                            }
                          },
                        ),
                      ),
                      if (scannedData.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Text(
                              'Scanned Data: $scannedData',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                    ],
                  ),

                  // Close Button
                  Positioned(
                    top: 50,
                    right: 20,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.black, size: 30),
                      onPressed: () {
                        Get.back(); // Close the scanner screen
                      },
                    ),
                  ),
                ],
              )
            : _buildPermissionRequiredUI());
  }

  Widget _buildPermissionRequiredUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt, size: 50, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Camera permission is required to scan QR codes.',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _handleCameraPermission,
            child: Text('Allow Camera Access'),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      // Handle the scanned QR code data
      print(scanData.code);
      Utils.toastMessageCenter(controller.hashCode.toString());
      // Navigator.pop(context, scanData.code);
      if (scanData.code != null) {
        scanProductVM.scanProductApi(scanData.code, eid!);
      } else {
        scanProductVM.scanProductApi(
            scanData.code != null ? scanData.code : "", eid!);
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Permission Required'),
        content: Text(
            'Camera access is required to scan QR codes. Please enable it in settings.'),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await openAppSettings();
            },
            child: Text('Open Settings'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Future<void> handleQrScan(Map<String, dynamic> qrData) async {
    try {
      // Extract rawValue from the scanned QR code data
      String rawValue = qrData['data'][0]['rawValue'] ?? '';
      if (rawValue.isEmpty) {
        throw Exception("No data found in QR code.");
      }

      // Parse the rawValue
      List<String> lines = rawValue.split('\n');
      Map<String, String> productInfo = {};
      for (var line in lines) {
        List<String> keyValue = line.split(': ');
        if (keyValue.length == 2) {
          productInfo[keyValue[0].trim()] = keyValue[1].trim();
        }
      }

      // Prepare payload for the API call
      Map<String, dynamic> payload = {
        "name": productInfo["Product Name"],
        "id": productInfo["Product ID"],
        "description": productInfo["Description"],
      };

      print(payload);

      // // Send payload to API
      // String apiUrl = "https://example.com/api/product";
      // var response = await http.post(
      //   Uri.parse(apiUrl),
      //   headers: {"Content-Type": "application/json"},
      //   body: jsonEncode(payload),
      // );
      //
      // // Handle the API response
      // if (response.statusCode == 200) {
      //   print("API Call Success: ${response.body}");
      // } else {
      //   print("API Call Failed: ${response.statusCode}");
      // }
    } catch (e) {
      print("Error handling QR data: $e");
    }
  }
}
