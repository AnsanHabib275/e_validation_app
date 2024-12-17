class NotificationListModel {
  String? complaintNo;
  String? status;

  NotificationListModel({this.complaintNo, this.status});

  NotificationListModel.fromJson(Map<String, dynamic> json) {
    complaintNo = json['complaintNo'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['complaintNo'] = this.complaintNo;
    data['status'] = this.status;
    return data;
  }
}
