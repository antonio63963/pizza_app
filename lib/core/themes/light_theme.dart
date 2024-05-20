import 'package:flutter/material.dart';
import 'package:pizza_app/core/constants.dart';

final ligthTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    surface: MyColors.dark,
    onSurface: MyColors.light,
    primary: Colors.blue,
    onPrimary: Colors.white,
  ),
  scaffoldBackgroundColor: MyColors.dark,
  
);
