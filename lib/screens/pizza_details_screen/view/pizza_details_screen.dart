import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_app/core/blocs/authenticatiion_bloc/authentication_bloc.dart';
import 'package:pizza_app/core/components/components.dart';
import 'package:pizza_app/core/router/route_name.dart';

class PizzaDetailsScreen extends StatelessWidget {
  final String title;
  final String id;
  const PizzaDetailsScreen({super.key, required this.title, required this.id,});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppAppBar(
              goBack: () => context.goNamed(RouteName.home),
              isAuthenticated: state.status == AuthStatus.authenticated,
              title: 'Details',
            ),
            body: ListView(children: [
              Text(title),
              Text(id),
            ],),
          );
        },
      ),
    );
  }
}
