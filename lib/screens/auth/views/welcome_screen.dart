import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

import 'package:pizza_app/core/components/components.dart';
import 'package:pizza_app/core/utils/constants.dart';
import 'package:pizza_app/core/utils/helper.dart';
import 'package:pizza_app/screens/auth/views/sign_in_screen.dart';
import 'package:pizza_app/screens/auth/views/sign_up_screen.dart';

final logger = Logger();

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              gradient: MyColors.bgGradient,
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 23,
                    vertical: 10,
                  ),
                  child: Image.asset('assets/img/welcome_img.png'),
                ),
                SvgPicture.asset(
                  'assets/svg/LOGO.svg',
                  width: 162,
                ),
                const SizedBox(height: 24),
                SvgPicture.asset(
                  'assets/svg/main_text.svg',
                ),
                const SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppPrimaryButton(
                      onClick: () => Helper.displayBottomModal(
                        context,
                        const SignInScreen(),
                      ),
                      text: 'LOGIN',
                    ),
                    const SizedBox(width: 20),
                    AppPrimaryButton(
                      bgColor: MyColors.orange,
                      onClick: () => Helper.displayBottomModal(
                        context,
                        const SignUpScreen(),
                      ),
                      text: 'REGISTRATION',
                    ),
                  ],
                ),
               const SizedBox(height: 40),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Continue as a Guest',
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            CupertinoIcons.chevron_right,
                            size: 16,
                            color: MyColors.light,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
              ],
            ),
          )),
    );
  }
}
