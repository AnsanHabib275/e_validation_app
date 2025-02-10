class ComplaintsListModel {
  bool? isSuccessfull;
  String? message;
  int? errorcode;
  List<Data>? data;

  ComplaintsListModel(
      {this.isSuccessfull, this.message, this.errorcode, this.data});

  factory ComplaintsListModel.fromJson(Map<String, dynamic> json) {
    return ComplaintsListModel(
      isSuccessfull: json["isSuccessfull"],
      message: json["message"],
      errorcode: json["errorcode"],
      data: json["data"] != null
          ? List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
          : [],
    );
  }
}

class Data {
  int? complaintId;
  int? status;
  String? datetime;
  int? qrCodeId;
  Data({this.complaintId, this.status, this.datetime, this.qrCodeId});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      complaintId: json['Complaint_Id'],
      status: json['Status'],
      datetime: json['datetime'],
      qrCodeId: json['QrCode_Id'],
    );
  }
}
