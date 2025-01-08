import 'dart:convert';
import 'dart:io';
import 'package:e_validation/data/exceptions/app_exceptions.dart';
import 'package:e_validation/data/network/base_api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url, {String? eid}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    if (eid != null) {
      headers['E_ID'] = eid;
    }
    dynamic responseJson;
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: headers,
          )
          .timeout(const Duration(seconds: 12));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url,
      {String? eid}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    if (eid != null) {
      headers['E_ID'] = eid;
    }
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 12));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> postFormDataApi(Map<String, String> data, String url,
      {List<http.MultipartFile>? files, String? eid}) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    if (eid != null) {
      headers['E_ID'] = eid;
    }
    dynamic responseJson;
    try {
      // final response = await http
      //     .post(Uri.parse(url), headers: headers, body: jsonEncode(data))
      //     .timeout(const Duration(seconds: 10));
      // responseJson = returnResponse(response);
      var uri = Uri.parse(url);
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);

      // Add text fields
      request.fields.addAll(data);
      // Add files (if any)
      if (files != null && files.isNotEmpty) {
        request.files.addAll(files);
      }

      // // Optional: Add a file to the form data
      // // Add multiple files (if any)
      // if (files != null && files.isNotEmpty) {
      //   for (var file in files) {
      //     String fieldName = file.path
      //         .split('/')
      //         .last; // Use filename as field name (adjust as needed)
      //     var multipartFile =
      //         await http.MultipartFile.fromPath(fieldName, file.path);
      //     request.files.add(multipartFile);
      //   }
      // }

      // Send the request
      var response = await request.send().timeout(const Duration(seconds: 12));
      var responseString = await http.Response.fromStream(response);
      responseJson = returnResponse(responseString);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      // throw InvalidUrlException;
      default:
        throw FetchDataException('error_while_communicating_with_server'.tr +
            response.statusCode.toString());
    }
  }
}
