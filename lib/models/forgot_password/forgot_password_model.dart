class ForgotPasswordModel {
  String? response;

  ForgotPasswordModel({this.response});

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Response'] = this.response;
    return data;
  }
}
