import 'dart:async';

import 'package:flutter/material.dart';

import 'package:give_me_a_job/utils/functions.dart';

class DayThree extends StatefulWidget {
  const DayThree({Key? key}) : super(key: key);

  @override
  State<DayThree> createState() => _DayThreeState();
}

class _DayThreeState extends State<DayThree> {
  Timer? timer;
  List<DateTime> dates = [
    DateTime.parse("2022-06-16 12:12:50.707554"),
    DateTime.parse("2022-06-25 01:31:13.707554"),
    DateTime.parse("2022-06-19 01:50:02.707554"),
    DateTime.now().add(const Duration(minutes: 1)),
  ];

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: ListView.builder(
            itemCount: dates.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: countDown(endDate: dates[index]) == null
                    ? const Text('Expired')
                    : Row(
                        children: [
                          countDown(endDate: dates[index])!.min == null
                              ? const Text('00 m : ')
                              : Text(
                                  '${countDown(endDate: dates[index])!.min} m : '),
                          Text('${countDown(endDate: dates[index])!.sec} s'),
                        ],
                      ),
              );
            },
          ),
        ));
  }
}
