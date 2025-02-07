class ScanHistoryModel {
  final bool isSuccessfull;
  final String message;
  final int errorcode;
  final List<Data> data;

  ScanHistoryModel(
      {required this.isSuccessfull,
      required this.message,
      required this.errorcode,
      required this.data});

  factory ScanHistoryModel.fromJson(Map<String, dynamic> json) {
    return ScanHistoryModel(
      isSuccessfull: json['isSuccessfull'] ?? false,
      message: json['message'] ?? '',
      errorcode: json['errorcode'] ?? 0,
      data: List<Data>.from(json['data']),
    );
  }
}

class Data {
  final int scanId;
  final String scanDateTime;
  final bool isEnable;
  final String scanDeviceIP;
  final String scanDeviceIdentity;
  final int scanAccountId;
  final int productId;
  final String productName;
  final String productExpiryDate;
  final String productCatogary;
  final String productTag;
  final String productManufacturingDate;
  final String productImageUrl1;
  final String productImageUrl2;
  final bool productIsEnabled;
  final String productManufacturerName;
  final int productPrice;
  final String productIdentityHash;
  final String productCreatedDateTime;
  final int scanCount;

  Data(
      {required this.scanId,
      required this.scanDateTime,
      required this.isEnable,
      required this.scanDeviceIP,
      required this.scanDeviceIdentity,
      required this.scanAccountId,
      required this.productId,
      required this.productName,
      required this.productExpiryDate,
      required this.productCatogary,
      required this.productTag,
      required this.productManufacturingDate,
      required this.productImageUrl1,
      required this.productImageUrl2,
      required this.productIsEnabled,
      required this.productManufacturerName,
      required this.productPrice,
      required this.productIdentityHash,
      required this.productCreatedDateTime,
      required this.scanCount});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      scanId: json['Scan_Id'] ?? 0,
      scanDateTime: json['Scan_DateTime'] ?? '',
      isEnable: json['IsEnable'] ?? false,
      scanDeviceIP: json['Scan_Device_IP'] ?? '',
      scanDeviceIdentity: json['Scan_Device_Identity'] ?? '',
      scanAccountId: json['Scan_AccountId'] ?? 0,
      productId: json['Product_Id'] ?? 0,
      productName: json['Product_Name'] ?? '',
      productExpiryDate: json['Product_Expiry_Date'] ?? '',
      productCatogary: json['Product_Catogary'] ?? '',
      productTag: json['Product_Tag'] ?? '',
      productManufacturingDate: json['Product_Manufacturing_Date'] ?? '',
      productImageUrl1: json['Product_Image_Url1'] ?? '',
      productImageUrl2: json['Product_Image_Url2'] ?? '',
      productIsEnabled: json['Product_IsEnabled'] ?? false,
      productManufacturerName: json['Product_Manufacturer_Name'] ?? '',
      productPrice: json['Product_Price'] ?? 0,
      productIdentityHash: json['Product_Identity_Hash'] ?? '',
      productCreatedDateTime: json['Product_CreatedDateTime'] ?? '',
      scanCount: json['Scan_Count'] ?? 0,
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['Scan_Id'] = this.scanId;
  //   data['Scan_DateTime'] = this.scanDateTime;
  //   data['IsEnable'] = this.isEnable;
  //   data['Scan_Device_IP'] = this.scanDeviceIP;
  //   data['Scan_Device_Identity'] = this.scanDeviceIdentity;
  //   data['Scan_AccountId'] = this.scanAccountId;
  //   data['Product_Id'] = this.productId;
  //   data['Product_Name'] = this.productName;
  //   data['Product_Expiry_Date'] = this.productExpiryDate;
  //   data['Product_Catogary'] = this.productCatogary;
  //   data['Product_Tag'] = this.productTag;
  //   data['Product_Manufacturing_Date'] = this.productManufacturingDate;
  //   data['Product_Image_Url1'] = this.productImageUrl1;
  //   data['Product_Image_Url2'] = this.productImageUrl2;
  //   data['Product_IsEnabled'] = this.productIsEnabled;
  //   data['Product_Manufacturer_Name'] = this.productManufacturerName;
  //   data['Product_Price'] = this.productPrice;
  //   data['Product_Identity_Hash'] = this.productIdentityHash;
  //   data['Product_CreatedDateTime'] = this.productCreatedDateTime;
  //   data['Scan_Count'] = this.scanCount;
  //   return data;
  // }
}
