import 'package:flutter/material.dart';

import 'package:give_me_a_job/widgets/custom_button.dart';

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
            CustomButton(route: '/dayOne', text: 'Day 1'),
            CustomButton(route: '/dayTwo', text: 'Day 2'),
          ],
        ),
      ),
    );
  }
}
