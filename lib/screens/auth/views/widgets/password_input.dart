import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/core/components/components.dart';
import 'package:pizza_app/core/utils/constants.dart';
import 'package:pizza_app/core/utils/my_styles.dart';
import 'package:pizza_app/core/utils/validators.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController passwordController;
  final String? errorMsg;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;
  final String? Function(String?) validator;
  const PasswordInput({
    super.key,
    required this.passwordController,
    this.validator = Validators.password,
    this.errorMsg,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.leftPadding = 0,
    this.rightPadding = 0,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.topPadding,
        bottom: widget.bottomPadding,
        left: widget.leftPadding,
        right: widget.rightPadding,
      ),
      child: TextFormField(
        style: MyStyles.input,
        controller: widget.passwordController,
        obscureText: obscurePassword,
        keyboardType: TextInputType.visiblePassword,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon:
              const Icon(CupertinoIcons.lock_fill, color: MyColors.dark),
          suffixIcon: IconButton(
            onPressed: () => setState(() => obscurePassword = !obscurePassword),
            icon: Icon(
              obscurePassword
                  ? CupertinoIcons.eye_fill
                  : CupertinoIcons.eye_slash_fill,
              color: MyColors.dark,
            ),
          ),
          errorText: widget.errorMsg,
        ),
      ),
    );
  }
}
