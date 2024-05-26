import 'package:flutter/material.dart';
import 'package:pizza_app/core/components/components.dart';
import 'package:pizza_app/core/utils/constants.dart';

class LoginOrRegistration extends StatelessWidget {
  final Function() onLoginBtn;
  final Function() onRegistragionBtn;

  const LoginOrRegistration({
    super.key,
    required this.onLoginBtn,
    required this.onRegistragionBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppPrimaryButton(
          onClick: onLoginBtn,
          text: 'LOGIN',
        ),
        const SizedBox(width: 20),
        AppPrimaryButton(
          bgColor: MyColors.orange,
          onClick: onRegistragionBtn,
          text: 'SIGNUP',
        ),
      ],
    );
  }
}
