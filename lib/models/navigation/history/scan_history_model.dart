class ScanHistoryModel {
  bool? isSuccessfull;
  String? message;
  int? errorcode;
  List<Data>? data;

  ScanHistoryModel(
      {this.isSuccessfull, this.message, this.errorcode, this.data});

  factory ScanHistoryModel.fromJson(Map<String, dynamic> json) {
    return ScanHistoryModel(
      isSuccessfull: json["isSuccessfull"],
      message: json["message"],
      errorcode: json["errorcode"],
      data: json["data"] != null
          ? List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
          : [],
    );
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
  String? productCategory;
  String? productTag;
  String? productManufacturingDate;
  String? productImageUrl1;
  String? productImageUrl2;
  bool? productIsEnabled;
  String? productManufacturerName;
  double? productPrice;
  String? productIdentityHash;
  String? productCreatedDateTime;
  int? scanCount;

  Data({
    this.scanId,
    this.scanDateTime,
    this.isEnable,
    this.scanDeviceIP,
    this.scanDeviceIdentity,
    this.scanAccountId,
    this.productId,
    this.productName,
    this.productExpiryDate,
    this.productCategory,
    this.productTag,
    this.productManufacturingDate,
    this.productImageUrl1,
    this.productImageUrl2,
    this.productIsEnabled,
    this.productManufacturerName,
    this.productPrice,
    this.productIdentityHash,
    this.productCreatedDateTime,
    this.scanCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      scanId: json["Scan_Id"],
      scanDateTime: json["Scan_DateTime"],
      isEnable: json["IsEnable"],
      scanDeviceIP: json["Scan_Device_IP"],
      scanDeviceIdentity: json["Scan_Device_Identity"],
      scanAccountId: json["Scan_AccountId"],
      productId: json["Product_Id"],
      productName: json["Product_Name"],
      productExpiryDate: json["Product_Expiry_Date"],
      productCategory: json["Product_Catogary"],
      productTag: json["Product_Tag"],
      productManufacturingDate: json["Product_Manufacturing_Date"],
      productImageUrl1: json["Product_Image_Url1"],
      productImageUrl2: json["Product_Image_Url2"],
      productIsEnabled: json["Product_IsEnabled"],
      productManufacturerName: json["Product_Manufacturer_Name"],
      productPrice: json["Product_Price"].toDouble(),
      productIdentityHash: json["Product_Identity_Hash"],
      productCreatedDateTime: json["Product_CreatedDateTime"],
      scanCount: json["Scan_Count"],
    );
  }
}
