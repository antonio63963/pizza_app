import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/constants.dart';

class PizzaPrice extends StatelessWidget {
  final double newPrice;
  final double? oldPrice;
  const PizzaPrice({
    super.key,
    required this.newPrice,
    this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '\$$newPrice',
          style: const TextStyle(
            fontFamily: 'Montserrat',
            color: MyColors.blue,
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(width: 8),
        if (oldPrice != null)
          Text(
            '\$$oldPrice',
            style: const TextStyle(
              fontFamily: 'Montserrat',
              decoration: TextDecoration.lineThrough,
              color: MyColors.grey,
              fontSize: 14,
            ),
          ),
      ],
    );
  }
}
