import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_app/core/blocs/authenticatiion_bloc/authentication_bloc.dart';
import 'package:pizza_app/screens/welcome_screen/views/welcome_screen.dart';
import 'package:pizza_app/screens/home/views/home_screen.dart';
import 'package:user_repository/user_repository.dart';

RouterConfig<Object>? routes(AuthenticationBloc bloc) {
  return GoRouter(
    initialLocation: '/home',
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
    redirect: (_, routerState) {
      logger.i('ROUTE STATE: ${routerState.uri}');
      bool isLoggedIn = bloc.state.status == AuthStatus.authenticated;
      // if (!isLoggedIn) {
      //   return '/';
      // } else {
      //  return routerState.uri.path == '/' ? '/home' : null;
      // }
      if (isLoggedIn) {
        return '/home';
      } else {
        return null;
      }
    },
    refreshListenable: RouterNotifier(bloc),
  );
}

class RouterNotifier extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.unknown;
  RouterNotifier(AuthenticationBloc bloc) {
    bloc.authStatus.listen((status) {
      logger.w('RouterNotifier: $status');
      if (status != authStatus) {
        authStatus = status;
        notifyListeners();
      }
    });
  }
}
