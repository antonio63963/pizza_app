import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/constants.dart';

class ContinueButton extends StatelessWidget {
  final Function() onPressed;
  final double topPadding;
  final double bottomPadding;
  const ContinueButton({
    super.key,
    required this.onPressed,
    this.topPadding = 40,
    this.bottomPadding = 70,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        bottom: bottomPadding,
      ),
      child: Row(
        children: [
          TextButton(
            onPressed: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Continue as a Guest',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(width: 6),
                const Icon(
                  CupertinoIcons.chevron_right,
                  size: 16,
                  color: MyColors.light,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
