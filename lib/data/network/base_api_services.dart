import 'package:http/http.dart' as http;
import 'dart:io';

abstract class BaseApiServices {
  Future<dynamic> getApi(String url, {String? apiKey});

  Future<dynamic> postApi(dynamic data, String url, {String? apiKey});

  Future<dynamic> postFormDataApi(Map<String, String> data, String url,
      {List<http.MultipartFile>? files, String? apiKey});
}
