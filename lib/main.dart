import 'package:flutter/material.dart';
import 'package:pmvvn_test/core/activity_manager.dart';
import 'package:pmvvn_test/repository/activity/activity_repository.dart';

import 'package:pmvvn_test/ui/home_page/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      builder: (context, child) => const MyApp(),
      providers: [
        Provider(
          create: (context) =>
              ActivityManager(activityRepository: ActivityRepository()),
        )
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PMVVN_TEST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
