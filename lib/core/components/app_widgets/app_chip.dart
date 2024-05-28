import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/constants.dart';
import 'package:pizza_app/data/models/app_filters.dart';

class AppChip extends StatelessWidget {
  final FilterP filter;
  final Function() onPressed;
  const AppChip({
    super.key,
    required this.filter,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.dark,
        shadowColor: MyColors.light,
      ),
      child: Row(
        children: [
          if (filter.isSelected)
            const Padding(
              padding: EdgeInsets.only(right: 6.0),
              child: Icon(
                CupertinoIcons.checkmark_alt,
                size: 16,
                color: MyColors.orange,
              ),
            ),
          Text(
            filter.title,
            style: TextStyle(
              color: filter.isSelected ? MyColors.orange : MyColors.light,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
