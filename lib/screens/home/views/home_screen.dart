import 'package:flutter/material.dart';
import 'package:pizza_app/core/components/components.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      appBar: AppAppBar(title: 'Home'),
    ));
  }
}
