import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/constants.dart';

class MyStyles {
  static InputDecorationTheme inputDecor = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(50),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: MyColors.orange),
      borderRadius: BorderRadius.circular(50),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: MyColors.red),
      borderRadius: BorderRadius.circular(50),
    ),
    fillColor: MyColors.light,
    filled: true,
    hintStyle: const TextStyle(color: MyColors.grey, fontSize: 14),
    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
  );

  static TextStyle input = const TextStyle(
    color: MyColors.dark,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );

  static const cardDecoration = BoxDecoration(
  color: MyColors.light,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(500),
    topRight: Radius.circular(500),
    bottomLeft: Radius.circular(50),
    bottomRight: Radius.circular(50),
  ),
  boxShadow: [
    BoxShadow(
      color: MyColors.darkLight,
      offset: Offset(2, 4),
      blurRadius: 5,
    )
  ],
);
}
