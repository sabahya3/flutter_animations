import 'package:flutter/material.dart';
import 'package:give_me_a_job/screens/day_four.dart';
import 'package:give_me_a_job/screens/day_one.dart';
import 'package:give_me_a_job/screens/day_three.dart';
import 'package:give_me_a_job/screens/day_two.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/dayOne': (context) => DayOne(),
  '/dayTwo': (context) => DayTwo(),
  '/dayThree': (context) => const DayThree(),
  '/dayFour': (context) => const DayFour(),
};
