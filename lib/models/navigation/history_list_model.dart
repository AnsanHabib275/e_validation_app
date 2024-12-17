class ComplaintsListModel {
  String? qrCodeNo;
  String? scanedOn;

  ComplaintsListModel({this.qrCodeNo, this.scanedOn});

  ComplaintsListModel.fromJson(Map<String, dynamic> json) {
    qrCodeNo = json['qrCodeNo'];
    scanedOn = json['scanedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qrCodeNo'] = this.qrCodeNo;
    data['scanedOn'] = this.scanedOn;
    return data;
  }
}
