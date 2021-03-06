import 'package:flutter/cupertino.dart';

class Scale {
  static late double widthDevice;
  static late double heightDevice;

  static double width(double percentage) => (widthDevice / 100) * percentage;
  static double height(double percentage) => (heightDevice / 100) * percentage;
  static double textSize(double size) => (widthDevice / 1000) * size;

  static void init(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    widthDevice = screenSize.width;
    heightDevice = screenSize.height;
  }
}

class AppFontSize {
  static double s0 = Scale.width(4.5);
  static double s1 = Scale.width(4.2);
  static double s2 = Scale.width(3.8);
  static double s3 = Scale.width(3.3);
  static double s4 = Scale.width(2.9);
  static double s5 = Scale.width(2.5);
  static double s6 = Scale.width(2.2);
  static double sh1 = Scale.width(10);
  static double sh2 = Scale.width(6);
}

class AppBorderRadius {
  static BorderRadius brAll3 = BorderRadius.all(Radius.circular(Scale.width(3)));
  static BorderRadius brAll5 = BorderRadius.all(Radius.circular(Scale.width(5)));
}
