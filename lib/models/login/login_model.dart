class LoginModel {
  bool? isSuccessfull;
  String? message;
  User? user;
  int? errorcode;

  LoginModel({this.isSuccessfull, this.message, this.user, this.errorcode});

  LoginModel.fromJson(Map<String, dynamic> json) {
    isSuccessfull = json['isSuccessfull'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    errorcode = json['errorcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccessfull'] = this.isSuccessfull;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['errorcode'] = this.errorcode;
    return data;
  }
}

class User {
  String? fullName;
  String? email;
  String? creationDate;
  String? eID;
  String? firstName;
  String? lastName;
  String? name;
  String? mobileNumbre;
  String? dOB;
  String? gender;
  String? countryCode;
  String? imageURL;

  User(
      {this.fullName,
      this.email,
      this.creationDate,
      this.eID,
      this.firstName,
      this.lastName,
      this.name,
      this.mobileNumbre,
      this.dOB,
      this.gender,
      this.countryCode,
      this.imageURL});

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['FullName'];
    email = json['Email'];
    creationDate = json['CreationDate'];
    eID = json['E_ID'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    name = json['Name'];
    mobileNumbre = json['MobileNumbre'];
    dOB = json['DOB'];
    gender = json['Gender'];
    countryCode = json['CountryCode'];
    imageURL = json['ImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FullName'] = this.fullName;
    data['Email'] = this.email;
    data['CreationDate'] = this.creationDate;
    data['E_ID'] = this.eID;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Name'] = this.name;
    data['MobileNumbre'] = this.mobileNumbre;
    data['DOB'] = this.dOB;
    data['Gender'] = this.gender;
    data['CountryCode'] = this.countryCode;
    data['ImageURL'] = this.imageURL;
    return data;
  }
}
