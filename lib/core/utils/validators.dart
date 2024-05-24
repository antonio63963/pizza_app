import 'package:pizza_app/screens/auth/views/widgets/phone_input/countries_model.dart';

class Validators {
  // static RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$');
  // 8 char, one uppercase, num, and one special character
  static RegExp passwordRexExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$');

  static String? email(val) {
    RegExp emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (val!.isEmpty) {
      return 'Please fill in this field';
    } else if (!emailRegExp.hasMatch(val)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? password(val) {
    if (val!.isEmpty) {
      return 'Please fill in this field';
    } else if (val.length < 6) {
      return 'Please enter a valid password min 6 symbols';
    }
    return null;
  }

  static String? repeatPassword(pass, val) {
    if (val!.isEmpty) {
      return 'Please fill in this field';
    } else if (val.length < 6) {
      return 'Please enter a valid password min 6 symbols';
    } else if (val != pass) {
      return 'Please enter the same password';
    }
    return null;
  }

  static String? name(val) {
    if (val!.isEmpty) {
      return 'Please fill in this field';
    } else if (val.length > 30) {
      return 'Name too long';
    }
    return null;
  }

  static String? phone(val, Country country) {
    final phoneRegExp =
        RegExp('^[0-9]{${country.minLength},${country.maxLength}}\$');
    // final phoneRegExp = RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$');
    if (val == null ||
        val.trim() == null ||
        val.trim() == '+${country.dialCode}') {
      return 'Please fill in this field';
    } else if (!phoneRegExp.hasMatch(val)) {
      return 'Please enter valid phone number';
    }
    return null;
  }
}
