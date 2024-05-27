import 'package:flutter/cupertino.dart';
import 'package:pizza_app/core/utils/constants.dart';

class CardAddButton extends StatelessWidget {
  final Function() onClick;
  const CardAddButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
            color: MyColors.dark,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: const Icon(
          CupertinoIcons.add,
          color: MyColors.light,
          size: 16,
        ),
      ),
    );
  }
}
