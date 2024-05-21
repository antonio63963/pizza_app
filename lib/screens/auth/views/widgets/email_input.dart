import 'package:flutter/cupertino.dart';
import 'package:pizza_app/core/components/components.dart';
import 'package:pizza_app/core/utils/constants.dart';
import 'package:pizza_app/core/utils/validators.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController emailController;
  final String? errorMsg;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;
  const EmailInput({
    super.key,
    required this.emailController,
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
      child: AppTextFormField(
        controller: emailController,
        hintText: 'Email',
        obscureText: false,
        keyboardType: TextInputType.emailAddress,
        prefixIcon: const Icon(CupertinoIcons.mail_solid, color: MyColors.dark,),
        errMsg: errorMsg,
        validator: Validators.email,
      ),
    );
  }
}
