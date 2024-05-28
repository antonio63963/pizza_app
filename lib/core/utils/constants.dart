import 'dart:ui';

import 'package:flutter/material.dart';

class MyColors {
  static const Color dark = Color(0xFF090E16);
  static const Color darkLight = Color(0xFF554F45);
  static const Color light = Color(0xFFFBEEDB);
  static const Color green = Color(0xFF52812D);
  static const Color yellow = Color.fromARGB(255, 237, 241, 17);
  static const Color orange = Color(0xFFF17911);
  static const Color grey = Color(0xFFBFB8AE);
  static const Color red = Color(0xFFDA5348);
  static const Color blue = Color(0xFF1185F1);
  static const Color redLight = Color(0xFFF7BD8A);

  static const Gradient bgGradient = RadialGradient(
    colors: [
      MyColors.darkLight,
      MyColors.dark,
    ],
    center: Alignment.center,
    radius: .7,
  );
}

class AppConst {
  static double appHorizontalPadding = 20;
}
