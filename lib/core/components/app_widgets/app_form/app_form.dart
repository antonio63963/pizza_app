import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/core/components/app_widgets/app_form/widgets/buttons_form.dart';
import 'package:pizza_app/core/components/app_widgets/app_form/widgets/header_form.dart';
import 'package:pizza_app/core/utils/constants.dart';

class AppForm extends StatelessWidget {
  final Key formKey;
  final String title;
  final List<Widget> widgets;
  final String imagePath;
  final Function() onSubmit;
  final bool isShownLoading;

  const AppForm({
    super.key,
    required this.formKey,
    required this.title,
    required this.widgets,
    required this.imagePath,
    required this.onSubmit,
    required this.isShownLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 50,
          ),
          decoration: const BoxDecoration(
            gradient: MyColors.bgGradient,
          ),
          child: ListView(
            children: [
              Align(
                child: Image.asset(
                  imagePath,
                  width: 280,
                ),
              ),
              const HeaderForm(title: 'Login'),
              ...widgets,
              ButtonsForm(
                isShownLoading: isShownLoading,
                onSubmit: onSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
