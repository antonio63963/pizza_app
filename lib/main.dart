import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pizza_app/app.dart';
import 'package:pizza_app/dev_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GetIt.I.registerSingleton<UserRepository>(FirebaseUserRepository());
  Bloc.observer = DevBlocObserver();
  runApp(const App());
}
