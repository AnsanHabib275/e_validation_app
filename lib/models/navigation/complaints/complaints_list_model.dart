class ComplaintsListModel {
  bool? isSuccessfull;
  String? message;
  int? errorcode;
  List<Data>? data;

  ComplaintsListModel(
      {this.isSuccessfull, this.message, this.errorcode, this.data});

  ComplaintsListModel.fromJson(Map<String, dynamic> json) {
    isSuccessfull = json['isSuccessfull'];
    message = json['message'];
    errorcode = json['errorcode'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccessfull'] = this.isSuccessfull;
    data['message'] = this.message;
    data['errorcode'] = this.errorcode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? complaintId;
  int? status;
  String? datetime;
  int? qrCodeId;

  Data({this.complaintId, this.status, this.datetime, this.qrCodeId});

  Data.fromJson(Map<String, dynamic> json) {
    complaintId = json['Complaint_Id'];
    status = json['Status'];
    datetime = json['datetime'];
    qrCodeId = json['QrCode_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Complaint_Id'] = this.complaintId;
    data['Status'] = this.status;
    data['datetime'] = this.datetime;
    data['QrCode_Id'] = this.qrCodeId;
    return data;
  }
}
