import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/constants.dart';
import 'package:pizza_app/core/utils/my_styles.dart';
import 'package:pizza_app/core/utils/validators.dart';
import 'package:pizza_app/screens/auth/views/widgets/phone_input/countries_model.dart';

class PhoneInput extends StatelessWidget {
  final TextEditingController phoneController;
  final Country country;
  final Function(String) onChanged;
  final String? errorMsg;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;
  const PhoneInput({
    super.key,
    required this.phoneController,
    required this.country,
    this.errorMsg,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.leftPadding = 0,
    this.rightPadding = 0,
    required this.onChanged,
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
        controller: phoneController,
        onChanged: onChanged,
        obscureText: false,
        keyboardType: TextInputType.emailAddress,
        validator: (val) => Validators.phone(val, country),
        decoration: InputDecoration(
          errorText: errorMsg,
          hintText: 'Phone',
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 14.0, right: 16, top: 14),
            child: Text("🇺🇦"),
          ),
        ),
      ),
    );
  }
}
