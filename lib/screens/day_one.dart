import 'package:flutter/material.dart';
import 'package:give_me_a_job/utils/constants.dart';
import 'package:give_me_a_job/utils/screen_size.dart';
import 'package:give_me_a_job/widgets/custom_animation_builder.dart';

class DayOne extends StatefulWidget {
  DayOne({Key? key}) : super(key: key);

  @override
  State<DayOne> createState() => _DayOneState();
}

class _DayOneState extends State<DayOne> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? animationOne;

  Animation<double>? animationTwo;
  Animation<double>? animationThree;
  Animation<double>? animationFour;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1900),
    );
    animationOne = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.0, 0.2, curve: Curves.easeIn)));

    animationTwo = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.2, 0.4, curve: Curves.easeIn)));

    animationThree = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _controller!,
            curve: const Interval(0.4, 0.6, curve: Curves.easeIn)));
    animationFour = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.6, 0.8, curve: Curves.easeIn)));
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = ScreenSize.instance.getHeight(context);
    double width = ScreenSize.instance.getWidth(context);
    return Scaffold(
      backgroundColor: const Color(0xffDBF3FF),
      body: Padding(
        padding:
            EdgeInsets.only(top: ScreenSize.instance.getHeight(context) * 0.09),
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAnimationBuilder(
                  animation: animationOne!,
                  xVal: 0.0,
                  yVal: -100,
                  height: height * 0.25,
                  image: nfts[0],
                  width: width * 0.95),
              SizedBox(height: height * 0.05),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.03, right: width * 0.02),
                child: Row(
                  children: [
                    Column(
                      children: [
                        CustomAnimationBuilder(
                            animation: animationTwo!,
                            xVal: -100,
                            yVal: 0.0,
                            height: height * 0.20,
                            image: nfts[2],
                            width: width * 0.45),
                        SizedBox(height: height * 0.05),
                        CustomAnimationBuilder(
                            animation: animationThree!,
                            xVal: -120,
                            yVal: 0.0,
                            height: height * 0.20,
                            image: nfts[3],
                            width: width * 0.45),
                      ],
                    ),
                    SizedBox(width: width * 0.05),
                    Column(
                      children: [
                        CustomAnimationBuilder(
                            animation: animationTwo!,
                            xVal: 100,
                            yVal: 0.0,
                            height: height * 0.20,
                            image: nfts[1],
                            width: width * 0.45),
                        SizedBox(height: height * 0.05),
                        CustomAnimationBuilder(
                            animation: animationThree!,
                            xVal: 120,
                            yVal: 0.0,
                            height: height * 0.20,
                            image: nfts[4],
                            width: width * 0.45),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              AnimatedBuilder(
                animation: animationFour!,
                builder: (context, child) {
                  return Opacity(
                    opacity: animationFour!.value * -1 + 1,
                    child: Transform.translate(
                      offset: Offset(0.0, animationFour!.value * 100),
                      child: child,
                    ),
                  );
                },
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 10,
                  child: Container(
                    height: height * 0.09,
                    width: width * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(nfts[6]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
