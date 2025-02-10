import 'package:e_validation/repository/reward_repository/reward_repository.dart';
import 'package:get/get.dart';
import '../../../../data/response/status.dart';
import '../../../../models/navigation/rewards/reward_list_model.dart';
import '../../user_preference/user_preference_view_model.dart';

class RewardViewModel extends GetxController {
  final _api = RewardRepository();

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;
  final rxRequestStatus = Status.LOADING.obs;
  List<RewardListModel> _rewardList = [];

  List<RewardListModel> get rewardList => _rewardList;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setRewardList(List<RewardListModel> rewards) => _rewardList = rewards;

  void setError(String value) => error.value = value;

  Future<void> rewardListApi() async {
    UserPreference userPreference = UserPreference();
    userPreference.getUser().then((user) async {
      var result = await _api.getRewardApi(user.user!.eID!);
      setRxRequestStatus(Status.COMPLETED);
      setRewardList(rewardList);
    });
  }
}
