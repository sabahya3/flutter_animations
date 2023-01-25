import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';

import 'package:flutter_countdown_timer/current_remaining_time.dart';


String remaining(
    {required DateTime start, required DateTime end, required String dOrMOrS}) {
  final difference = start.difference(end).toString().split(":");

  if (dOrMOrS == 'h') {
    return difference[0];
  }
  if (dOrMOrS == 'm') {
    return difference[1];
  }
  if (dOrMOrS == 's') {
    return difference[2].split(".")[0];
  }

  return 'Expired';
}

CurrentRemainingTime? countDown({required DateTime endDate}) {
  int end = (endDate.millisecondsSinceEpoch + 1000 * 30);

  const int _daySecond = 60 * 60 * 24;

  ///Seconds in an hour
  const int _hourSecond = 60 * 60;

  /// in a minute
  const int _minuteSecond = 60;
  int remainingTimeStamp =
      (end - DateTime.now().millisecondsSinceEpoch) ~/ 1000;
  if (remainingTimeStamp <= 0) {
    return null;
  }
  int? days, hours, min;

  ///Calculate the number of days remaining.
  if (remainingTimeStamp >= _daySecond) {
    days = remainingTimeStamp ~/ _daySecond;
    remainingTimeStamp %= _daySecond;
  }

  ///Calculate remaining hours.
  if (remainingTimeStamp >= _hourSecond) {
    hours = remainingTimeStamp ~/ _hourSecond;
    remainingTimeStamp %= _hourSecond;
  } else if (days != null) {
    hours = 0;
  }

  ///Calculate remaining minutes.
  if (remainingTimeStamp >= _minuteSecond) {
    min = remainingTimeStamp ~/ _minuteSecond;
    remainingTimeStamp %= _minuteSecond;
  } else if (hours != null) {
    min = 0;
  }

  ///Calculate remaining second.
  return CurrentRemainingTime(
    days: days,
    hours: hours,
    min: min,
    sec: remainingTimeStamp,
  );
}

upload(File imageFile) async {    
      // open a bytestream
      var stream =  http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      // get file length
      var length = await imageFile.length();

      // string to uri
      var uri = Uri.parse("http://ip:8082/composer/predict");

      // create multipart request
      var request =  http.MultipartRequest("POST", uri);

      // multipart that takes file
      var multipartFile =  http.MultipartFile('file', stream, length,
          filename: basename(imageFile.path));

      // add file to multipart
      request.files.add(multipartFile);

      // send
      var response = await request.send();
      
      
     http.Response.fromStream(response).then((value) => print(value.body));

 
    }