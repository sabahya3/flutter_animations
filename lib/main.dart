import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:give_me_a_job/home_page.dart';
import 'package:give_me_a_job/screens/stream_test.dart';
import 'package:give_me_a_job/utils/navigation.dart';
import 'package:give_me_a_job/utils/routes.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();



   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
 
      theme: ThemeData.dark(),
      home:  Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text('welcome home',style: TextStyle(color: Colors.white),),
            Center(child: Container( height: 200,width: 200,color: Colors.white, child: Image.network('https://res.cloudinary.com/dhuwauyuo/image/upload/v1659541582/gdwmket06gupkzkcfhdc.png')),),
          ],
        ),
      ),
    );
  }
}
