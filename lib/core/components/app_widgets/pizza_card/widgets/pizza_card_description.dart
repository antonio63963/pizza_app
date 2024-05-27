import 'package:flutter/material.dart';

class PizzaCardDescription extends StatelessWidget {
  final String description;
  const PizzaCardDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        height: 35,
        child: Text(
          description,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 14,
                overflow: TextOverflow.clip,
                color: Colors.grey.shade700,
              ),
        ),
      ),
    );
  }
}
