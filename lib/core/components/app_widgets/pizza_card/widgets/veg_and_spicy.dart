import 'package:flutter/cupertino.dart';
import 'package:pizza_app/core/utils/constants.dart';

import '../../tag_pizza.dart';

class VegAndSpicy extends StatelessWidget {
  final bool isVegan;
  final bool isSpicy;
  const VegAndSpicy({super.key, this.isVegan = false, this.isSpicy = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TagPizza(
          tagName: isVegan ? 'Pure-veg' : 'Non-veg',
          bgColor: isVegan ? MyColors.green : null,
        ),
        const SizedBox(width: 8),
        TagPizza(
          tagName: isSpicy ? 'spicy' : 'non-spicy',
          bgColor: MyColors.redLight,
          textColor: MyColors.red,
          icon: CupertinoIcons.flame,
        )
      ],
    );
  }
}
