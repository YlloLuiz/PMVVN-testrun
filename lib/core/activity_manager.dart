import 'package:pmvvn_test/core/activity_manager_contract.dart';
import 'package:pmvvn_test/model/activity_model.dart';
import 'package:pmvvn_test/repository/activity/activity_repository_contract.dart';

class ActivityManager implements ActivityManagerContract {
  ActivityRepositoryContract activityRepository;

  ActivityManager({required this.activityRepository});

  ActivityModel? actualActivity;

  @override
  getActivity() async {
    actualActivity = await activityRepository.getActivity();

    return actualActivity;
  }
}
