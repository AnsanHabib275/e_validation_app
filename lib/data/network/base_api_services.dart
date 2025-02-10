import 'package:http/http.dart' as http;

abstract class BaseApiServices {
  Future<dynamic> getApi(String url, {String? eid});

  Future<dynamic> postApi(dynamic data, String url, {String? eid});

  Future<dynamic> postFormDataApi(Map<String, String> data, String url,
      {List<http.MultipartFile>? files, String? eid});
}
