// To parse this JSON data, do
//
//     final scanmodel = scanmodelFromJson(jsonString);

import 'dart:convert';

Scanmodel scanmodelFromJson(String str) => Scanmodel.fromJson(json.decode(str));
String scanDataModelToJson(Scanmodel data) => json.encode(data.toJson());

class Scanmodel {
  Scanmodel({
    this.isSuccessfull,
    this.message,
    this.data,
  });

  bool? isSuccessfull;
  String? message;
  Data? data;

  factory Scanmodel.fromJson(Map<String, dynamic> json) => Scanmodel(
        isSuccessfull: json["IsSuccessfull"],
        message: json["Message"],
        data: Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "IsSuccessfull": isSuccessfull,
        "Message": message,
        "Data": data?.toJson(),
      };
}

class Data {
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

  dynamic productId;
  String? productName;
  String? productExpiryDate;
  String? productCatogary;
  dynamic productTag;
  String? productManufacturingDate;
  String? productImageUrl1;
  String? productImageUrl2;
  bool? productIsEnabled;
  dynamic productManufacturerName;
  dynamic productPrice;
  String? productIdentityHash;
  String? productCreatedDateTime;
  int? scanCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        productId: json["Product_Id"],
        productName: json["Product_Name"],
        productExpiryDate: json["Product_Expiry_Date"],
        productCatogary: json["Product_Catogary"],
        productTag: json["Product_Tag"],
        productManufacturingDate: json["Product_Manufacturing_Date"],
        productImageUrl1: json["Product_Image_Url1"],
        productImageUrl2: json["Product_Image_Url2"],
        productIsEnabled: json["Product_IsEnabled"],
        productManufacturerName: json["Product_Manufacturer_Name"],
        productPrice: json["Product_Price"],
        productIdentityHash: json["Product_Identity_Hash"],
        productCreatedDateTime: json["Product_CreatedDateTime"],
        scanCount: json['Scan_Count'] != null
            ? int.tryParse(json['Scan_Count'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "Product_Id": productId,
        "Product_Name": productName,
        "Product_Expiry_Date": productExpiryDate,
        "Product_Catogary": productCatogary,
        "Product_Tag": productTag,
        "Product_Manufacturing_Date": productManufacturingDate,
        "Product_Image_Url1": productImageUrl1,
        "Product_Image_Url2": productImageUrl2,
        "Product_IsEnabled": productIsEnabled,
        "Product_Manufacturer_Name": productManufacturerName,
        "Product_Price": productPrice,
        "Product_Identity_Hash": productIdentityHash,
        "Product_CreatedDateTime": productCreatedDateTime,
        "Scan_Count": scanCount,
      };
}
