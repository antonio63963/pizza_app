import 'package:flutter/cupertino.dart';
import 'package:pizza_app/core/components/components.dart';
import 'package:pizza_app/core/utils/constants.dart';

class ButtonsForm extends StatelessWidget {
  final bool isShownLoading;
  final Function() onSubmit;

  const ButtonsForm({
    super.key,
    required this.isShownLoading,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppPrimaryButton(
          isShownLoading: isShownLoading,
          onClick: onSubmit,
          text: 'SUBMIT',
        ),
        const SizedBox(width: 24),
        AppPrimaryButton(
          bgColor: MyColors.dark,
          onClick: () => Navigator.pop(context),
          text: 'CANCEL',
        ),
      ],
    );
  }
}
