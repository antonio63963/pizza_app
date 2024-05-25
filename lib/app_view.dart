import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pizza_app/core/blocs/authenticatiion_bloc/authentication_bloc.dart';
import 'package:pizza_app/core/routes.dart';
import 'package:pizza_app/core/themes/light_theme.dart';
import 'package:user_repository/user_repository.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes(
        AuthenticationBloc(
          userRepository: GetIt.I<UserRepository>(),
        ),
      ),
      title: 'Pizza Order',
      debugShowCheckedModeBanner: false,
      theme: ligthTheme,
    );
  }
}
