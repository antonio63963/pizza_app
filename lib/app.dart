import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pizza_app/app_view.dart';
import 'package:pizza_app/core/blocs/authenticatiion_bloc/authentication_bloc.dart';
import 'package:pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_app/screens/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            userRepository: GetIt.I<UserRepository>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => SignInBloc(GetIt.I<UserRepository>()),
        ),
        RepositoryProvider(
          create: (context) => SignUpBloc(GetIt.I<UserRepository>()),
        ),
      ],
      child: const AppView(),
    );
  }
}
