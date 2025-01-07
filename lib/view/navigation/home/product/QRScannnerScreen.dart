import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isCameraEnabled = false;

  @override
  void initState() {
    super.initState();
    // _checkCameraPermission();
    _handleCameraPermission();
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
                  QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderColor: Colors.black,
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 5,
                      cutOutSize: 300, // Adjust size as needed
                    ),
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

                  // Bottom Navigation Bar-like Section
                  // Positioned(
                  //   bottom: 0,
                  //   left: 0,
                  //   right: 0,
                  //   child: Container(
                  //     color: Colors.white,
                  //     padding: EdgeInsets.symmetric(vertical: 10),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       children: [
                  //         Icon(Icons.card_giftcard, color: Colors.black),
                  //         Icon(Icons.history, color: Colors.black),
                  //         Icon(Icons.home, color: Colors.black),
                  //         Icon(Icons.notifications, color: Colors.black),
                  //         Icon(Icons.info, color: Colors.black),
                  //       ],
                  //     ),
                  //   ),
                  // ),
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
      Navigator.pop(context, scanData.code);
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
}
