import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_app/core/blocs/authenticatiion_bloc/authentication_bloc.dart';
import 'package:pizza_app/core/components/app_widgets/app_form/app_form.dart';

import 'package:pizza_app/screens/auth/views/widgets/email_input.dart';
import 'package:pizza_app/screens/auth/views/widgets/password_input.dart';
import 'package:pizza_app/screens/home/views/home_screen.dart';
import 'package:user_repository/user_repository.dart';

import '../blocs/sign_in_bloc/sign_in_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool signInRequired = false;
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  String? _errorMsg;

  @override
  Widget build(BuildContext context) {
    void onSubmit() {
      if (_formKey.currentState!.validate()) {
        context.read<SignInBloc>().add(
              SignInAction(
                email: emailController.text,
                password: passwordController.text,
              ),
            );
      }
    }

    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          setState(() {
            signInRequired = false;
            // context.go(HomeScreen.routeName);
          });
        } else if (state is SignInLoading) {
          setState(() {
            signInRequired = true;
          });
        } else if (state is SignInFailure) {
          setState(() {
            signInRequired = false;
            _errorMsg = 'Invalid email or password';
          });
        }
      },
      child: AppForm(
        formKey: _formKey,
        title: 'Login',
        widgets: [
          EmailInput(
            emailController: emailController,
            topPadding: 30,
            errorMsg: _errorMsg,
          ),
          PasswordInput(
            passwordController: passwordController,
            topPadding: 20,
            bottomPadding: 60,
            errorMsg: _errorMsg,
          ),
        ],
        imagePath: 'assets/img/auth_pic_2.png',
        onSubmit: onSubmit,
        isShownLoading: signInRequired,
      ),
    );
  }
}
