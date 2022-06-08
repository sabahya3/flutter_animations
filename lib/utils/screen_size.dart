import 'package:flutter/widgets.dart';

class ScreenSize {
  static ScreenSize instance = ScreenSize();

  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
