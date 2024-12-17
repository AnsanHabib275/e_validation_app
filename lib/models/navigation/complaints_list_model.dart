class HistoryListModel {
  String? qrCodeNo;
  String? status;

  HistoryListModel({this.qrCodeNo, this.status});

  HistoryListModel.fromJson(Map<String, dynamic> json) {
    qrCodeNo = json['qrCodeNo'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qrCodeNo'] = this.qrCodeNo;
    data['status'] = this.status;
    return data;
  }
}
