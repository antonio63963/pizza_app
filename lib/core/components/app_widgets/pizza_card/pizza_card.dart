import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/constants.dart';
import 'package:pizza_app/core/utils/my_styles.dart';
import 'package:pizza_app/data/models/pizza_model.dart';

import 'widgets/card_add_button.dart';
import 'widgets/pizza_card_description.dart';
import 'widgets/pizza_price.dart';
import 'widgets/pizza_titile.dart';
import 'widgets/veg_and_spicy.dart';

class PizzaCard extends StatelessWidget {
  final Pizza pizza;
  const PizzaCard({super.key, required this.pizza});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shape: const RoundedRectangleBorder(borderRadius: MyStyles.cardBorder),
      color: MyColors.light,
      child: InkWell(
        borderRadius: MyStyles.cardBorder,
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(pizza.img),
              const SizedBox(height: 16),
              VegAndSpicy(
                isSpicy: pizza.isSpicy,
                isVegan: pizza.isVegan,
              ),
              PizzaCardTitle(title: pizza.title),
              PizzaCardDescription(description: pizza.description),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PizzaPrice(
                    newPrice: pizza.price,
                    oldPrice: pizza.oldPrice,
                  ),
                  CardAddButton(
                    onClick: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
