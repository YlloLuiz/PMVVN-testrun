import 'package:flutter/material.dart';
import 'package:pmvvn_test/core/activity_manager.dart';
import 'package:pmvvn_test/ui/home_page_stacked/home_page_viewmodel_stacked.dart';
import 'package:provider/src/provider.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModelStacked>.reactive(
      builder: (context, viewModel, _) => HomeLayout(viewModel: viewModel),
      viewModelBuilder: () => HomePageViewModelStacked(
        activityManager: context.read<ActivityManager>(),
      ),
      createNewModelOnInsert: false,
    );
  }
}

class HomeLayout extends StatelessWidget {
  final HomePageViewModelStacked viewModel;

  const HomeLayout({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF190834),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(58.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: viewModel.isBusy == false
                    ? RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text:
                              "${viewModel.activity == null ? "Are you bored? let me find something for you" : viewModel.activity?.activity}\n\n",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          children: [
                            TextSpan(
                              text: viewModel.activity != null
                                  ? "Price: \$ ${viewModel.activity?.price}\n\n"
                                  : "",
                              style: TextStyle(fontSize: 14),
                            ),
                            TextSpan(
                              text: viewModel.activity != null
                                  ? "How many people can join: ${viewModel.activity?.participants}"
                                  : "",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    : CircularProgressIndicator(),
              ),
            ),
          ),
          TextButton(
            onPressed: () async => await viewModel.futureToRun(),
            child: Text("Find me something to do!"),
          )
        ],
      ),
    );
  }
}
