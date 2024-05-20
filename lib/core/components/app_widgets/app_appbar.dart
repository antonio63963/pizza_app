import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: SvgPicture.asset('assets/svg/LOGO.svg'),
      title: Text(
        title,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => context.read<SignInBloc>().add(SignOutAction()),
          icon: const Icon(CupertinoIcons.square_arrow_right),
        ),
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
