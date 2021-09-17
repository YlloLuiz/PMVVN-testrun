import 'package:flutter/foundation.dart';
import 'package:pmvvn_test/core/activity_manager_contract.dart';
import 'package:pmvvn_test/model/activity_model.dart';
import 'package:pmvvn_test/ui/home_page_stacked/home_page_contract_stacked.dart';

class HomePageViewModelStacked extends ChangeNotifier
    implements HomePageContract {
  ActivityManagerContract activityManager;
  ActivityModel? activity;

  HomePageViewModelStacked({required this.activityManager});

  @override
  Future<void> getActivity() async {
    activity = await activityManager.getActivity();
    notifyListeners();
  }
}
