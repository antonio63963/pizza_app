import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/constants.dart';

class Helper {
  static Future displayBottomModal(BuildContext context, Widget content) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        backgroundColor: MyColors.dark,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        builder: (_) => content);
  }
}
