import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/constants.dart';

enum ButtonPosition { left, right }

class CarouselControllButton extends StatelessWidget {
  final ButtonPosition buttonPosition;
  final Function() onTap;
  const CarouselControllButton({
    super.key,
    required this.buttonPosition,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: buttonPosition == ButtonPosition.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.dstOut,
        color: Colors.white,
        borderRadius: buttonPosition == ButtonPosition.left
            ? const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          buttonPosition == ButtonPosition.left
              ? CupertinoIcons.chevron_back
              : CupertinoIcons.chevron_forward,
          color: MyColors.light,
          size: 24,
        ),
      ),
    );
  }
}
