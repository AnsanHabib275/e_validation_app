class ScanProductModel {
  bool? isSuccessfull;
  String? message;
  Data? data;
  int? errorcode;

  ScanProductModel(
      {this.isSuccessfull, this.message, this.data, this.errorcode});

  ScanProductModel.fromJson(Map<String, dynamic> json) {
    isSuccessfull = json['isSuccessfull'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errorcode = json['errorcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccessfull'] = isSuccessfull;
    data['message'] = message;
    if (this.data != null) {
      data['user'] = this.data!.toJson();
    }
    data['errorcode'] = errorcode;
    return data;
  }
}

class Data {
  String? productId;
  String? productName;
  String? productExpiryDate;
  String? productCatogary;
  String? productTag;
  String? productManufacturingDate;
  String? productImageUrl1;
  String? productImageUrl2;
  bool? productIsEnabled;
  String? productManufacturerName;
  String? productPrice;
  String? productIdentityHash;
  String? productCreatedDateTime;
  int? scanCount;

  Data({
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
    this.scanCount,
  });

  Data.fromJson(Map<String, dynamic> json) {
    productId = json["Product_Id"];
    productName = json["Product_Name"];
    productExpiryDate = json["Product_Expiry_Date"];
    productCatogary = json["Product_Catogary"];
    productTag = json["Product_Tag"];
    productManufacturingDate = json["Product_Manufacturing_Date"];
    productImageUrl1 = json["Product_Image_Url1"];
    productImageUrl2 = json["Product_Image_Url2"];
    productIsEnabled = json["Product_IsEnabled"];
    productManufacturerName = json["Product_Manufacturer_Name"];
    productPrice = json["Product_Price"];
    productIdentityHash = json["Product_Identity_Hash"];
    productCreatedDateTime = json["Product_CreatedDateTime"];
    scanCount =
        json['Scan_Count'] != null ? int.tryParse(json['Scan_Count']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Product_Id'] = productId;
    data['Product_Name'] = productName;
    data['Product_Expiry_Date'] = productExpiryDate;
    data['Product_Catogary'] = productCatogary;
    data['Product_Tag'] = productTag;
    data['Product_Manufacturing_Date'] = productManufacturingDate;
    data['Product_Image_Url1'] = productImageUrl1;
    data['Product_Image_Url2'] = productImageUrl2;
    data['Product_IsEnabled'] = productIsEnabled;
    data['Product_Manufacturer_Name'] = productManufacturerName;
    data['Product_Price'] = productPrice;
    data['Product_Identity_Hash'] = productIdentityHash;
    data['Product_CreatedDateTime'] = productCreatedDateTime;
    data['Scan_Count'] = scanCount;
    return data;
  }
}
