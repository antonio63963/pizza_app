import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/core/blocs/authenticatiion_bloc/authentication_bloc.dart';
import 'package:pizza_app/core/components/components.dart';
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
    return SafeArea(
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppAppBar(
              title: 'Home',
              isAuthenticated: state.status == AuthStatus.authenticated,
            ),
            body: Padding(
              padding: const EdgeInsets.all(6.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 9 / 16,
                ),
                itemCount: pizzaList.length,
                itemBuilder: (_, idx) {
                  final p = pizzaList[idx];
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: MyColors.light,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(500),
                        topRight: Radius.circular(500),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: MyColors.darkLight,
                          offset: Offset(2, 4),
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(p.img),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            TagPizza(
                              tagName: p.isVegan ? 'Pure-veg' : 'Non-veg',
                            ),
                            const SizedBox(width: 8),
                            TagPizza(
                              tagName: p.isSpicy ? 'spicy' : 'non-spicy',
                              bgColor: MyColors.redLight,
                              textColor: MyColors.red,
                              icon: CupertinoIcons.flame,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 5.0,
                              ),
                              child: Text(
                                p.title,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            SizedBox(
                              height: 35,
                              child: Text(
                                p.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: 14,
                                      overflow: TextOverflow.clip,
                                    ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '\$${p.price}',
                                      style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: MyColors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '\$${p.oldPrice}',
                                      style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        decoration: TextDecoration.lineThrough,
                                        color: MyColors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: const BoxDecoration(
                                      color: MyColors.dark,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Icon(
                                      CupertinoIcons.add,
                                      color: MyColors.light,
                                      size: 16,
                                    ),
                                    
                                    ),
                                ),
                                
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
