class LoginModel {
  final bool isSuccessfull;
  final String message;
  final User user;
  final int errorcode;

  LoginModel(
      {required this.isSuccessfull,
      required this.message,
      required this.user,
      required this.errorcode});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        isSuccessfull: json['isSuccessfull'] ?? false,
        message: json['message'] ?? '',
        user: json['user'],
        errorcode: json['errorcode'] ?? 0);
    // isSuccessfull = json['isSuccessfull'];
    // message = json['message'];
    // user = json['user'] != null ? new User.fromJson(json['user']) : null;
    // errorcode = json['errorcode'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['isSuccessfull'] = this.isSuccessfull;
  //   data['message'] = this.message;
  //   if (this.user != null) {
  //     data['user'] = this.user!.toJson();
  //   }
  //   data['errorcode'] = this.errorcode;
  //   return data;
  // }
}

class User {
  final String fullName;
  final String email;
  final String creationDate;
  final String eID;
  final String firstName;
  final String lastName;
  final String mobileNumbre;
  final String dOB;
  final String gender;
  final String countryCode;
  final String imageURL;

  User(
      {required this.fullName,
      required this.email,
      required this.creationDate,
      required this.eID,
      required this.firstName,
      required this.lastName,
      required this.mobileNumbre,
      required this.dOB,
      required this.gender,
      required this.countryCode,
      required this.imageURL});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        fullName: json['FullName'] ?? '',
        email: json['Email'] ?? '',
        creationDate: json['CreationDate'] ?? '',
        eID: json['E_ID'] ?? '',
        firstName: json['FirstName'] ?? '',
        lastName: json['LastName'] ?? '',
        mobileNumbre: json['MobileNumbre'] ?? '',
        dOB: json['DOB'] ?? '',
        gender: json['Gender'] ?? '',
        countryCode: json['CountryCode'] ?? '',
        imageURL: json['ImageURL'] ?? '');
    // fullName = json['FullName'];
    // email = json['Email'];
    // creationDate = json['CreationDate'];
    // eID = json['E_ID'];
    // firstName = json['FirstName'];
    // lastName = json['LastName'];
    // mobileNumbre = json['MobileNumbre'];
    // dOB = json['DOB'];
    // gender = json['Gender'];
    // countryCode = json['CountryCode'];
    // imageURL = json['ImageURL'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['FullName'] = this.fullName;
  //   data['Email'] = this.email;
  //   data['CreationDate'] = this.creationDate;
  //   data['E_ID'] = this.eID;
  //   data['FirstName'] = this.firstName;
  //   data['LastName'] = this.lastName;
  //   data['MobileNumbre'] = this.mobileNumbre;
  //   data['DOB'] = this.dOB;
  //   data['Gender'] = this.gender;
  //   data['CountryCode'] = this.countryCode;
  //   data['ImageURL'] = this.imageURL;
  //   return data;
  // }
}
