import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/constants.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?) validator;
  final FocusNode? focusNode;
  final String? errMsg;
  final String? Function(String?)? onChanged;

  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    required this.validator,
    this.focusNode,
    this.errMsg,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      focusNode: focusNode,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MyColors.orange),
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: MyColors.red),
          borderRadius: BorderRadius.circular(50),
        ),
        fillColor: MyColors.light,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: MyColors.grey, fontSize: 14),
        errorText: errMsg,
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12)
      ),
    );
  }
}
