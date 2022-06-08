import 'package:flutter/material.dart';

class CustomAnimationBuilder extends StatelessWidget {
  CustomAnimationBuilder({
    Key? key,
    required this.animation,
    required this.xVal,
    required this.yVal,
    required this.height,
    required this.image,
    required this.width,
  }) : super(key: key);
  Animation<double> animation;
  double xVal;
  double yVal;

  String image;
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value * -1 + 1,
          child: Transform.translate(
            offset: Offset(animation.value * xVal, animation.value * yVal),
            child: child,
          ),
        );
      },
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
