import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/core/constants.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? bgColor;
  final Color? shadowColor;
  final Function() onClick;

  const AppPrimaryButton({
    super.key,
    required this.text,
     this.textColor,
     this.bgColor,
     this.shadowColor,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        elevation: 4,
        backgroundColor: bgColor ?? MyColors.green,
        shadowColor: shadowColor ?? MyColors.light,
      ),
      onPressed: onClick,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          text,
          style: TextStyle(color: textColor ?? MyColors.light, fontWeight: FontWeight.bold, fontSize: 16)
        ),
      ),
    );
  }
}
