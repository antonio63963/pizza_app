import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_app/core/utils/constants.dart';
import 'package:pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isAuthenticated;
  const AppAppBar({
    super.key,
    required this.title,
    required this.isAuthenticated,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SvgPicture.asset('assets/svg/LOGO.svg'),
      ),
      title: Text(
        title,
      ),
      centerTitle: true,
      actions: [
        isAuthenticated
            ? IconButton(
                onPressed: () =>
                    context.read<SignInBloc>().add(SignOutAction()),
                icon: const Icon(CupertinoIcons.square_arrow_right),
              )
            : IconButton(
                onPressed: () => context.go('/'),
                icon: const Icon(
                  CupertinoIcons.square_arrow_left,
                  color: MyColors.light,
                ),
              ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.cart,
            color: MyColors.light,
          ),
        )
      ],
      flexibleSpace: ClipRRect(
          child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(color: Colors.transparent),
      )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
