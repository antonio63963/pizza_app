import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/core/components/components.dart';
import 'package:pizza_app/core/utils/constants.dart';

class TagPizza extends StatelessWidget {
  final String tagName;
  final Color? bgColor;
  final Color? textColor;
  final IconData? icon;
  const TagPizza({
    super.key,
    required this.tagName,
    this.bgColor,
    this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: bgColor ?? MyColors.red,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: Icon(
                icon,
                size: 16,
                color: textColor ?? MyColors.light,
              ),
            ),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              tagName.toUpperCase(),
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textColor ?? MyColors.light,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
