import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_app/core/blocs/authenticatiion_bloc/authentication_bloc.dart';
import 'package:pizza_app/core/components/app_widgets/pizza_card/pizza_card.dart';
import 'package:pizza_app/core/components/components.dart';
import 'package:pizza_app/core/router/route_name.dart';
import 'package:pizza_app/core/utils/constants.dart';
import 'package:pizza_app/data/models/pizza_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pizzaList = pizzas;
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return SafeArea(
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            appBar: AppAppBar(
              title: 'Home',
              isAuthenticated: state.status == AuthStatus.authenticated,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 9 / 16,
                ),
                itemCount: pizzaList.length,
                itemBuilder: (_, idx) {
                  final p = pizzaList[idx];
                  return PizzaCard(
                    pizza: p,
                    onClick: () => context.goNamed(
                      RouteName.details,
                      pathParameters: {
                        "id": p.id,
                        'title': p.title,
                      },
                    ),
                  );
                },
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              color: MyColors.dark.withOpacity(.2),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TagPizza(tagName: 'Offers'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TagPizza(tagName: 'Veg'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TagPizza(tagName: 'Offers'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TagPizza(tagName: 'Veg'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TagPizza(tagName: 'Offers'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TagPizza(tagName: 'Veg'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TagPizza(tagName: 'Offers'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TagPizza(tagName: 'Veg'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
