class RewardListModel {
  String? points;
  String? name;
  String? counts;

  RewardListModel({this.points, this.name, this.counts});

  RewardListModel.fromJson(Map<String, dynamic> json) {
    points = json['points'];
    name = json['name'];
    counts = json['counts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['points'] = this.points;
    data['name'] = this.name;
    data['counts'] = this.counts;
    return data;
  }
}
