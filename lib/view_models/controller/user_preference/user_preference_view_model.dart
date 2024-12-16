import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/login/login_model.dart';

class UserPreference extends GetxController {
  Future<bool> saveUser(LoginModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('response', responseModel.response.toString());
    sp.setString('token', responseModel.token.toString());
    sp.setString('company', responseModel.company.toString());
    sp.setString('email', responseModel.email.toString());
    sp.setString('full_name', responseModel.fullName.toString());
    sp.setString('api_key', responseModel.apiKey.toString());
    sp.setString('uid', responseModel.uid.toString());
    return true;
  }

  Future<LoginModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? response = sp.getString('response');
    String? token = sp.getString('token');
    String? company = sp.getString('company');
    String? email = sp.getString('email');
    String? fullName = sp.getString('full_name');
    String? apiKey = sp.getString('api_key');
    String? uid = sp.getString('uid');
    return LoginModel(
        response: response,
        token: token,
        company: company,
        email: email,
        fullName: fullName,
        apiKey: apiKey,
        uid: uid);
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
