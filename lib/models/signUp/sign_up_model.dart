class SignUpModel {
  String? email;
  String? createdOn;
  String? fullName;
  String? company;
  String? uid;
  String? statusMessage;

  SignUpModel(
      {this.email,
      this.createdOn,
      this.fullName,
      this.company,
      this.uid,
      this.statusMessage});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    createdOn = json['created_on'];
    fullName = json['full_name'];
    company = json['company'];
    uid = json['uid'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['created_on'] = this.createdOn;
    data['full_name'] = this.fullName;
    data['company'] = this.company;
    data['uid'] = this.uid;
    data['status_message'] = this.statusMessage;
    return data;
  }
}
