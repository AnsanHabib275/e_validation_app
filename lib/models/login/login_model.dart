class LoginModel {
  String? response;
  String? token;
  String? company;
  String? email;
  String? fullName;
  String? apiKey;
  String? uid;

  LoginModel(
      {this.response,
      this.token,
      this.company,
      this.email,
      this.fullName,
      this.apiKey,
      this.uid});

  LoginModel.fromJson(Map<String, dynamic> json) {
    response = json['Response'];
    token = json['Token'];
    company = json['company'];
    email = json['email'];
    fullName = json['full_name'];
    apiKey = json['Api_key'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Response'] = this.response;
    data['Token'] = this.token;
    data['company'] = this.company;
    data['email'] = this.email;
    data['full_name'] = this.fullName;
    data['Api_key'] = this.apiKey;
    data['uid'] = this.uid;
    return data;
  }
}
