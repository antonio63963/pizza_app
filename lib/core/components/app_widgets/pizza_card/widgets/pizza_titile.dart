import 'package:flutter/material.dart';

class PizzaCardTitle extends StatelessWidget {
  final String title;
  const PizzaCardTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 5.0,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
