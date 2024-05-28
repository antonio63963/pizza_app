import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/constants.dart';


class BottomFilterRow extends StatelessWidget {
  final ScrollController scrollController;
  final List<Widget> widgets;
  const BottomFilterRow(
      {super.key, required this.scrollController, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 14),
      color: MyColors.dark.withOpacity(.7),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: widgets,
        ),
      ),
    );
  }
}
