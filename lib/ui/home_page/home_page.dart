import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:pmvvn_test/core/activity_manager.dart';
import 'package:pmvvn_test/ui/home_page/home_page_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<HomePageViewModel>(
      view: (context, viewModel) => const _HomePage(),
      viewModel: HomePageViewModel(
        activityManager: context.read<ActivityManager>(),
      ),
    );
  }
}

class _HomePage extends StatelessView<HomePageViewModel> {
  const _HomePage({Key? key}) : super(key: key, reactive: true);

  @override
  Widget render(BuildContext context, HomePageViewModel viewModel) {
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
                child: RichText(
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
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () async => await viewModel.getActivity(),
            child: Text("Find me something to do!"),
          )
        ],
      ),
    );
  }
}
