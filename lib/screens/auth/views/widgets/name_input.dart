import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/core/components/components.dart';
import 'package:pizza_app/core/utils/constants.dart';
import 'package:pizza_app/core/utils/my_styles.dart';
import 'package:pizza_app/core/utils/validators.dart';

class NameInput extends StatelessWidget {
  final TextEditingController nameController;
  final String? errorMsg;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;
  const NameInput({
    super.key,
    required this.nameController,
    this.errorMsg,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.leftPadding = 0,
    this.rightPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        bottom: bottomPadding,
        left: leftPadding,
        right: rightPadding,
      ),
      child: TextFormField(
        style: MyStyles.input,
        controller: nameController,
        obscureText: false,
        keyboardType: TextInputType.text,
        validator: Validators.name,
        decoration: InputDecoration(
          errorText: errorMsg,
          hintText: 'Name',
          prefixIcon: const Icon(
            CupertinoIcons.mail_solid,
            color: MyColors.dark,
          ),
        ),
      ),
    );
  }
}
