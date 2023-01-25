import 'package:flutter/material.dart';
import 'package:give_me_a_job/services/ad_helper.dart';
import 'package:give_me_a_job/services/auth_service.dart';
import 'package:give_me_a_job/utils/constants.dart';
import 'package:give_me_a_job/utils/screen_size.dart';
import 'package:give_me_a_job/widgets/animated_text_field.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DayTwo extends StatefulWidget {
  const DayTwo({Key? key}) : super(key: key);

  @override
  State<DayTwo> createState() => _DayTwoState();
}

class _DayTwoState extends State<DayTwo> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? animationOne;

  Animation<double>? animationTwo;
  Animation<double>? animationThree;
  Animation<double>? animationFour;

  // ads 
  BannerAd? banner;

void createBannerAd() {
    banner = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) => print('${ad.runtimeType} loaded.'),
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('${ad.runtimeType} failed to load: $error');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => print('${ad.runtimeType} opened.'),
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {
          print('${ad.runtimeType} closed');
          ad.dispose();
          createBannerAd();
          print('${ad.runtimeType} reloaded');
        },
        // Called when an ad is in the process of leaving the application.
      ),
    )..load();
  }

  @override
  void initState() {


  createBannerAd();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
    );
    animationOne = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn)));

    animationTwo = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.4, 0.6, curve: Curves.easeIn)));

    animationThree = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _controller!,
            curve: const Interval(0.6, 0.8, curve: Curves.easeIn)));
    animationFour = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.8, 1.0, curve: Curves.easeIn)));
    _controller!.forward();

    // ads 



    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    banner!.dispose();

    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    double height = ScreenSize.instance.getHeight(context);
    double width = ScreenSize.instance.getWidth(context);
    return Scaffold(
      backgroundColor: const Color(0xFFedeff6),
      body: Padding(
        padding:
            EdgeInsets.only(top: ScreenSize.instance.getHeight(context) * 0.09),
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: width * 0.20,
                        height: height * 0.15,
                        child: Image.network(
                          'https://res.cloudinary.com/cimaroom-ar/image/upload/v1659538962/Profile%20Images/xzwtzfvqc2ckpuszbefk.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                        text: 'Login to ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'BeUpToDate',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                    SizedBox(height: height * 0.01),
                    const Text('Trailer into a glance',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        )),
                    SizedBox(height: height * 0.09),
                    AnimatedTextField(
                        animation: animationOne,
                        prefix: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(Icons.person, color: Colors.black),
                        ),
                        hintText: 'Enter your email',
                        yVal: 100,
                        suffix: null),
                    AnimatedTextField(
                        animation: animationTwo,
                        prefix: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(Icons.work, color: Colors.black),
                        ),
                        hintText: 'Orgnization name',
                        yVal: 100,
                        suffix: null),
                    AnimatedTextField(
                      animation: animationThree,
                      prefix: null,
                      hintText: 'Enter your password',
                      yVal: 100,
                      suffix: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.visibility, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Spacer(),
                          AnimatedBuilder(
                            animation: animationFour!,
                            builder: (context, child) {
                              return Opacity(
                                opacity: animationFour!.value * -1 + 1,
                                child: Transform.translate(
                                  offset: Offset(animationFour!.value * -100, 0.0),
                                  child: child,
                                ),
                              );
                            },
                            child: SizedBox(
                                width: width * 0.35,
                                height: height * 0.08,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color(0xFFedeff6),
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: Colors.black, width: 2),
                                          borderRadius: BorderRadius.circular(15))),
                                  child: const Text(
                                    'Face ID',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {},
                                )),
                          ),
                          const Spacer(),
                          AnimatedBuilder(
                            animation: animationFour!,
                            builder: (context, child) {
                              return Opacity(
                                opacity: animationFour!.value * -1 + 1,
                                child: Transform.translate(
                                  offset: Offset(animationFour!.value * 100, 0.0),
                                  child: child,
                                ),
                              );
                            },
                            child: SizedBox(
                                width: width * 0.35,
                                height: height * 0.08,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15))),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    AuthService.instance.loginWithFacebook();
                                  },
                                )),
                          ),
                          const Spacer()
                        ],
                      ),
                    )
                  ],
                ),
            Align(
        alignment: Alignment.bottomCenter,
        child: banner == null
            ? SizedBox(
                height: 50,
              )
            : Container(
                height: 50,
                child: AdWidget(
                  ad: banner!,
                ),
              ),
      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
