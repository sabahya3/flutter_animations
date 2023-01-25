import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StreamHttpTest extends StatelessWidget {
  const StreamHttpTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('error'),
      ),
      body: Container(
        color: Colors.blueAccent,
        child: StreamBuilder<List<dynamic>>(
          stream: Stream.fromFuture(getAllAnimes()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
            }
            if (snapshot.connectionState==ConnectionState.waiting) {
                 print(snapshot.data);
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }

             if (snapshot.connectionState==ConnectionState.done) {
                 print(snapshot.data);
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

Future<List> getAllAnimes() async {
  List? body;
  try {
    http.Response response =
        await http.get(Uri.parse('https://taima-app.herokuapp.com/anime'));

    if (response.statusCode == 200) {
      body = jsonDecode(response.body);
    }
  } catch (e) {}

  return body!;
}
