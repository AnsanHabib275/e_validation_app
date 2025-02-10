import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/login/login_model.dart';

class UserPreference extends GetxController {
  RxString user_eid = ''.obs;
  RxString user_fullName = ''.obs;
  RxString user_email = ''.obs;
  RxString user_firstName = ''.obs;
  RxString user_lastName = ''.obs;
  RxString user_ImageURL = ''.obs;
  RxString user_mobileNumber = ''.obs;
  RxString user_CountryCode = ''.obs;
  RxString user_dob = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  void fetchUserDetails() async {
    var user = await getUser();
    user_eid.value = user.user?.eID ?? '';
    user_fullName.value = user.user?.fullName ?? '';
    user_email.value = user.user?.email ?? '';
    user_firstName.value = user.user?.firstName ?? '';
    user_lastName.value = user.user?.lastName ?? '';
    user_ImageURL.value = user.user?.imageURL ?? '';
    user_mobileNumber.value = user.user?.mobileNumbre ?? '';
    user_CountryCode.value = user.user?.countryCode ?? '';
    user_dob.value = user.user?.dOB ?? '';
  }

  Future<bool> saveUser(LoginModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('isSuccessfull', responseModel.isSuccessfull ?? false);
    sp.setString('message', responseModel.message ?? '');
    sp.setString('user_fullName', responseModel.user?.fullName ?? '');
    sp.setString('user_email', responseModel.user?.email ?? '');
    sp.setString('user_firstName', responseModel.user?.firstName ?? '');
    sp.setString('user_lastName', responseModel.user?.lastName ?? '');
    sp.setString('user_mobileNumber', responseModel.user?.mobileNumbre ?? '');
    sp.setString('user_creationDate', responseModel.user?.creationDate ?? '');
    sp.setString('user_eID', responseModel.user?.eID ?? '');
    sp.setString('user_dob', responseModel.user?.dOB ?? '');
    sp.setString('user_gender', responseModel.user?.gender ?? '');
    sp.setString('user_CountryCode', responseModel.user?.countryCode ?? '');
    sp.setString('user_ImageURL', responseModel.user?.imageURL ?? '');
    sp.setInt('errorcode', responseModel.errorcode ?? 0);
    return true;
  }

  Future<LoginModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isSuccessfull = sp.getBool('isSuccessfull') ?? false;
    String message = sp.getString('message') ?? '';
    int errorcode = sp.getInt('errorcode') ?? 0;

    User user = User(
      fullName: sp.getString('user_fullName') ?? '',
      email: sp.getString('user_email') ?? '',
      firstName: sp.getString('user_firstName') ?? '',
      lastName: sp.getString('user_lastName') ?? '',
      mobileNumbre: sp.getString('user_mobileNumber') ?? '',
      creationDate: sp.getString('user_creationDate') ?? '',
      eID: sp.getString('user_eID') ?? '',
      dOB: sp.getString('user_dob') ?? '',
      gender: sp.getString('user_gender') ?? '',
      countryCode: sp.getString('user_CountryCode') ?? '',
      imageURL: sp.getString('user_ImageURL') ?? '',
    );

    return LoginModel(
      isSuccessfull: isSuccessfull,
      message: message,
      user: user,
      errorcode: errorcode,
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
