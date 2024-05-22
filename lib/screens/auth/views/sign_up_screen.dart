import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/core/components/app_widgets/app_form/app_form.dart';
import 'package:pizza_app/screens/auth/views/widgets/phone_input/countries_model.dart';
import 'package:pizza_app/screens/auth/views/widgets/phone_input/phone_input.dart';

import 'package:user_repository/user_repository.dart';
import 'package:flutter/cupertino.dart';

import '../blocs/sign_up_bloc/sign_up_bloc.dart';
import 'widgets/email_input.dart';
import 'widgets/name_input.dart';
import 'widgets/password_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final Country country;
  final passwordController = TextEditingController();
  final repeatePasswordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obscurePassword = true;
  bool signUpRequired = false;

  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8Length = false;

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      MyUser myUser = MyUser.empty;
      myUser = myUser.copyWith(
        email: emailController.text,
        name: nameController.text,
      );
      setState(() {
        context.read<SignUpBloc>().add(
              SignUpAction(myUser: myUser, password: passwordController.text),
            );
      });
    }
  }

  void onChangedPhoneValue(String val) {}

  @override
  void initState() {
    super.initState();
    country = CountriesList.getByName('Ukraine');
    phoneController.text = '+${country.dialCode}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          setState(() {
            signUpRequired = false;
          });
          // Navigator.pop(context);
        } else if (state is SignUpLoading) {
          setState(() {
            signUpRequired = true;
          });
        } else if (state is SignUpFailure) {
          return;
        }
      },
      child: AppForm(
        formKey: _formKey,
        title: 'Registration',
        widgets: [
          NameInput(
            nameController: nameController,
            bottomPadding: 20,
          ),
          EmailInput(
            emailController: emailController,
            bottomPadding: 20,
            // errorMsg: _errorMsg,
          ),
          PhoneInput(
            phoneController: phoneController,
            country: country,
            onChanged: onChangedPhoneValue,
            bottomPadding: 20,
          ),
          PasswordInput(
            passwordController: passwordController,
          ),
          PasswordInput(
            passwordController: repeatePasswordController,
            topPadding: 20,
            bottomPadding: 60,
            // errorMsg: _errorMsg,
          ),
        ],
        imagePath: 'assets/img/auth_pic_1.png',
        onSubmit: onSubmit,
        isShownLoading: signUpRequired,
      ),
    );
  }
}
