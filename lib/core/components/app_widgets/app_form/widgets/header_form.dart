import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/constants.dart';

class HeaderForm extends StatelessWidget {
  final String title;
  const HeaderForm({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 50),
      width: double.infinity,
      height: 48,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title.toUpperCase(),
              style: theme.textTheme.bodyLarge?.copyWith(
                color: MyColors.light,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                CupertinoIcons.multiply_circle,
                weight: 24,
                color: MyColors.light,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
