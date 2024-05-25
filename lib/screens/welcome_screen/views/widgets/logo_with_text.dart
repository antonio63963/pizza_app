import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/svg/LOGO.svg',
          width: 162,
        ),
        const SizedBox(height: 24),
        SvgPicture.asset(
          'assets/svg/main_text.svg',
        ),
        const SizedBox(height: 90),
      ],
    );
  }
}
