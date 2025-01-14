import 'package:http/http.dart' as http;
import 'dart:io';

abstract class BaseApiServicesNew {
  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(dynamic data, String url);

  Future<dynamic> postFormDataApi(Map<String, String> data, String url,
      {List<http.MultipartFile>? files});
}
