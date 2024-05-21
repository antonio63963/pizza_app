import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/constants.dart';

final ligthTheme = ThemeData(
  fontFamily: 'Montserrat',
  colorScheme: const ColorScheme.light(
    surface: MyColors.dark,
    onSurface: MyColors.light,
    primary: Colors.blue,
    onPrimary: Colors.white,
  ),
  scaffoldBackgroundColor: MyColors.dark,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Quicksand',
      color: MyColors.dark,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: MyColors.grey,
      fontSize: 16,
      fontFamily: 'Montserrat',
    ),
    bodySmall: TextStyle(
      color: MyColors.grey,
      fontSize: 12,
      fontFamily: 'Montserrat',
    ),
    labelLarge: TextStyle(
      color: MyColors.light,
      fontSize: 10,
    ),
  ),

);
