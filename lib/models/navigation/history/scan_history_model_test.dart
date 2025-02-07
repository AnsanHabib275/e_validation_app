class ScanHistoryModelTest {
  bool? isSuccessfull;
  String? message;
  int? errorcode;
  List<Data>? data;

  ScanHistoryModelTest(
      {this.isSuccessfull, this.message, this.errorcode, this.data});

  ScanHistoryModelTest.fromJson(Map<String, dynamic> json) {
    isSuccessfull = json['isSuccessfull'];
    message = json['message'];
    errorcode = json['errorcode'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccessfull'] = this.isSuccessfull;
    data['message'] = this.message;
    data['errorcode'] = this.errorcode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? scanId;
  String? scanDateTime;
  bool? isEnable;
  String? scanDeviceIP;
  String? scanDeviceIdentity;
  int? scanAccountId;
  int? productId;
  String? productName;
  String? productExpiryDate;
  String? productCatogary;
  String? productTag;
  String? productManufacturingDate;
  String? productImageUrl1;
  String? productImageUrl2;
  bool? productIsEnabled;
  String? productManufacturerName;
  int? productPrice;
  String? productIdentityHash;
  String? productCreatedDateTime;
  int? scanCount;

  Data(
      {this.scanId,
      this.scanDateTime,
      this.isEnable,
      this.scanDeviceIP,
      this.scanDeviceIdentity,
      this.scanAccountId,
      this.productId,
      this.productName,
      this.productExpiryDate,
      this.productCatogary,
      this.productTag,
      this.productManufacturingDate,
      this.productImageUrl1,
      this.productImageUrl2,
      this.productIsEnabled,
      this.productManufacturerName,
      this.productPrice,
      this.productIdentityHash,
      this.productCreatedDateTime,
      this.scanCount});

  Data.fromJson(Map<String, dynamic> json) {
    scanId = json['Scan_Id'];
    scanDateTime = json['Scan_DateTime'];
    isEnable = json['IsEnable'];
    scanDeviceIP = json['Scan_Device_IP'];
    scanDeviceIdentity = json['Scan_Device_Identity'];
    scanAccountId = json['Scan_AccountId'];
    productId = json['Product_Id'];
    productName = json['Product_Name'];
    productExpiryDate = json['Product_Expiry_Date'];
    productCatogary = json['Product_Catogary'];
    productTag = json['Product_Tag'];
    productManufacturingDate = json['Product_Manufacturing_Date'];
    productImageUrl1 = json['Product_Image_Url1'];
    productImageUrl2 = json['Product_Image_Url2'];
    productIsEnabled = json['Product_IsEnabled'];
    productManufacturerName = json['Product_Manufacturer_Name'];
    productPrice = json['Product_Price'];
    productIdentityHash = json['Product_Identity_Hash'];
    productCreatedDateTime = json['Product_CreatedDateTime'];
    scanCount = json['Scan_Count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Scan_Id'] = this.scanId;
    data['Scan_DateTime'] = this.scanDateTime;
    data['IsEnable'] = this.isEnable;
    data['Scan_Device_IP'] = this.scanDeviceIP;
    data['Scan_Device_Identity'] = this.scanDeviceIdentity;
    data['Scan_AccountId'] = this.scanAccountId;
    data['Product_Id'] = this.productId;
    data['Product_Name'] = this.productName;
    data['Product_Expiry_Date'] = this.productExpiryDate;
    data['Product_Catogary'] = this.productCatogary;
    data['Product_Tag'] = this.productTag;
    data['Product_Manufacturing_Date'] = this.productManufacturingDate;
    data['Product_Image_Url1'] = this.productImageUrl1;
    data['Product_Image_Url2'] = this.productImageUrl2;
    data['Product_IsEnabled'] = this.productIsEnabled;
    data['Product_Manufacturer_Name'] = this.productManufacturerName;
    data['Product_Price'] = this.productPrice;
    data['Product_Identity_Hash'] = this.productIdentityHash;
    data['Product_CreatedDateTime'] = this.productCreatedDateTime;
    data['Scan_Count'] = this.scanCount;
    return data;
  }
}
