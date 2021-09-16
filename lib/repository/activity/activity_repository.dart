import 'dart:convert';

import 'package:http/http.dart' as Http;

import 'package:pmvvn_test/model/activity_model.dart';
import 'package:pmvvn_test/repository/activity/activity_repository_contract.dart';
import 'package:pmvvn_test/utils/constants.dart';

class ActivityRepository implements ActivityRepositoryContract {
  @override
  Future<ActivityModel> getActivity() async {
    ActivityModel result = ActivityModel();

    Http.Response response = await Http.get(
      Uri.parse(Constants.getRandomActivity),
    );

    if (response.statusCode == 200) {
      result = ActivityModel.fromJson(json.decode(response.body));
    }

    return result;
  }
}
