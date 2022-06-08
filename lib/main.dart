import 'package:flutter/material.dart';
import 'package:give_me_a_job/screens/day_one.dart';
import 'package:give_me_a_job/utils/navigation.dart';
import 'package:give_me_a_job/utils/screen_size.dart';

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
      routes: {'/dayOne': (context) => DayOne()},
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Need an internship'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  NavigationService.navigator.navigateTo('/dayOne');
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.instance.getHeight(context) * 0.08,
                      vertical: 15),
                  child: const Text('Day 1', style: TextStyle(fontSize: 20)),
                )),
          ],
        ),
      ),
    );
  }
}
