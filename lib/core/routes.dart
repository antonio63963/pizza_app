import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_app/core/blocs/authenticatiion_bloc/authentication_bloc.dart';
import 'package:pizza_app/screens/welcome_screen/views/welcome_screen.dart';
import 'package:pizza_app/screens/home/views/home_screen.dart';

RouterConfig<Object>? routes(AuthenticationBloc bloc) {
  return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
      redirect: (_, state) {
        final isAuthenticated = bloc.state.status == AuthStatus.authenticated;
      },
      // refreshListenable: bloc,
      );
}
