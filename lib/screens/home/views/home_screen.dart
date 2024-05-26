import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/core/blocs/authenticatiion_bloc/authentication_bloc.dart';
import 'package:pizza_app/core/components/components.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAuth = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppAppBar(
          title: 'Home',
          isAuthenticated: context.read<AuthenticationBloc>().state.status ==
              AuthStatus.authenticated,
        ),
        body: Center(
          child: Text(
            context.read<AuthenticationBloc>().state.status.toString(),
          ),
        ),
      ),
    );
  }
}
