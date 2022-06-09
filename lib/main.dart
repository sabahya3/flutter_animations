import 'package:flutter/material.dart';
import 'package:give_me_a_job/home_page.dart';
import 'package:give_me_a_job/utils/navigation.dart';
import 'package:give_me_a_job/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigator.navigationController,
      routes: routes,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
