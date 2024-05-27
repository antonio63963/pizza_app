import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:pizza_app/core/blocs/authenticatiion_bloc/authentication_bloc.dart';

import 'package:pizza_app/core/components/components.dart';
import 'package:pizza_app/core/utils/constants.dart';
import 'package:pizza_app/core/utils/helper.dart';
import 'package:pizza_app/screens/auth/views/sign_in_screen.dart';
import 'package:pizza_app/screens/auth/views/sign_up_screen.dart';
import 'package:pizza_app/screens/home/views/home_screen.dart';
import 'package:pizza_app/screens/welcome_screen/views/widgets/continue_btn.dart';
import 'package:pizza_app/screens/welcome_screen/views/widgets/login_or_registration.dart';
import 'package:pizza_app/screens/welcome_screen/views/widgets/logo_with_text.dart';

final logger = Logger();

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void displayLogin() =>
      Helper.displayBottomModal(context, const SignInScreen());
  void displayRegistration() =>
      Helper.displayBottomModal(context, const SignUpScreen());
  void goToHomeScreen() => context.go(HomeScreen.routeName);

  @override
  Widget build(BuildContext context) {
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
              const LogoWithText(),
              LoginOrRegistration(
                onLoginBtn: displayLogin,
                onRegistragionBtn: displayRegistration,
              ),
              context.watch<AuthenticationBloc>().state.status ==
                      AuthStatus.authenticated
                  ? const SizedBox()
                  : ContinueButton(
                      onPressed: goToHomeScreen,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
