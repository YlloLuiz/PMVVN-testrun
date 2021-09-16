import 'package:pmvvm/pmvvm.dart';
import 'package:pmvvn_test/core/activity_manager_contract.dart';
import 'package:pmvvn_test/model/activity_model.dart';
import 'package:pmvvn_test/ui/home_page/home_page_contract.dart';

class HomePageViewModel extends ViewModel implements HomePageContract {
  ActivityManagerContract activityManager;
  ActivityModel? activity;

  HomePageViewModel({required this.activityManager});

  @override
  Future<void> getActivity() async {
    activity = await activityManager.getActivity();
    notifyListeners();
  }
}
