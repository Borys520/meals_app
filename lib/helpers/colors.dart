import 'package:flutter/material.dart';

abstract class CustomColors {
  static Map<int, Color> color = {
    50: const Color.fromRGBO(255, 100, 43, .1),
    100: const Color.fromRGBO(255, 100, 43, .2),
    200: const Color.fromRGBO(255, 100, 43, .3),
    300: const Color.fromRGBO(255, 100, 43, .4),
    400: const Color.fromRGBO(255, 100, 43, .5),
    500: const Color.fromRGBO(255, 100, 43, .6),
    600: const Color.fromRGBO(255, 100, 43, .7),
    700: const Color.fromRGBO(255, 100, 43, .8),
    800: const Color.fromRGBO(255, 100, 43, .9),
    900: const Color.fromRGBO(255, 100, 43, 1),
  };

  static MaterialColor primaryColor = MaterialColor(0xFFFF642B, color);
}
