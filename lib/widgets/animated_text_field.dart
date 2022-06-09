import 'package:flutter/material.dart';
import 'package:give_me_a_job/utils/screen_size.dart';

class AnimatedTextField extends StatelessWidget {
  AnimatedTextField(
      {Key? key,
      required this.animation,
      required this.prefix,
      required this.hintText,
      required this.yVal,
      required this.suffix})
      : super(key: key);

  Animation<double>? animation;
  Widget? prefix;
  Widget? suffix;
  String hintText;
  double yVal;
  @override
  Widget build(BuildContext context) {
    double width = ScreenSize.instance.getWidth(context);
    double height = ScreenSize.instance.getHeight(context);
    return AnimatedBuilder(
      animation: animation!,
      builder: (context, child) {
        return Opacity(
          opacity: animation!.value * -1 + 1,
          child: Transform.translate(
            offset: Offset(0.0, animation!.value * yVal),
            child: child,
          ),
        );
      },
      child: SizedBox(
        width: width * 0.85,
        height: height * 0.12,
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: Padding(
                  padding: EdgeInsets.only(left: width * 0.03), child: prefix),
              suffixIcon: suffix,
              fillColor: Colors.white,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
