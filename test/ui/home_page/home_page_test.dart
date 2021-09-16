import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pmvvn_test/core/activity_manager.dart';
import 'package:pmvvn_test/model/activity_model.dart';
import 'package:pmvvn_test/repository/activity/activity_repository_contract.dart';
import 'package:pmvvn_test/ui/home_page/home_page_viewmodel.dart';

import 'home_page_test.mocks.dart';

@GenerateMocks([ActivityRepositoryContract])
void main() {
  late HomePageViewModel viewModel;
  late ActivityManager activityManager;
  late MockActivityRepositoryContract activityRepository;
  group("HomePageViewModel", () {
    setUp(() {
      activityRepository = MockActivityRepositoryContract();
      activityManager = ActivityManager(activityRepository: activityRepository);
      viewModel = HomePageViewModel(activityManager: activityManager);
    });

    test("Expect success when getting activity", () async {
      when(activityRepository.getActivity()).thenAnswer(
        (_) => ActivityModel(
            accessibility: "5",
            activity: "Get activity",
            key: "",
            link: "",
            participants: 5,
            price: "5.0",
            type: ""),
      );

      await viewModel.getActivity();

      expect(viewModel.activity, isNotNull);
      expect(activityManager.actualActivity, isNotNull);
    });
  });
}
