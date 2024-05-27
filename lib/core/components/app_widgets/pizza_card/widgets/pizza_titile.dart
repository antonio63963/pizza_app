import 'package:flutter/material.dart';

class PizzaCardTitle extends StatelessWidget {
  final String title;
  const PizzaCardTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 5.0,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
