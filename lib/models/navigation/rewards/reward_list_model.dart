class RewardListModel {
  final String points;
  final String name;
  final String counts;

  RewardListModel(this.points, this.name, this.counts);
  // RewardListModel({required this.points, required this.name, required this.counts});
  //
  // factory RewardListModel.fromJson(Map<String, dynamic> json) {
  //   return RewardListModel(
  //       points : json['points'],
  //       name : json['name'],
  //       counts : json['counts'],
  //   );
  // }
}
