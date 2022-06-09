import 'package:flutter/material.dart';
import 'package:give_me_a_job/utils/navigation.dart';
import 'package:give_me_a_job/utils/screen_size.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.route, required this.text})
      : super(key: key);
  String route;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: ScreenSize.instance.getHeight(context) * 0.03),
      child: ElevatedButton(
          onPressed: () {
            NavigationService.navigator.navigateTo(route);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.instance.getHeight(context) * 0.08,
                vertical: 15),
            child: Text(text, style: const TextStyle(fontSize: 20)),
          )),
    );
  }
}
