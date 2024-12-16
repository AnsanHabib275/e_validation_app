import 'package:get/get.dart';

class AppExceptions implements Exception {
  final _prefix;
  final _message;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_message$_prefix';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, 'no_internet'.tr);
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, 'request_time_out'.tr);
}

class ServerException extends AppExceptions {
  ServerException([String? message])
      : super(message, 'internal_server_error'.tr);
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, 'invalid_url'.tr);
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'error_while_communication'.tr);
}
