import 'package:e_commerce_route/presentation/home/tabs/home_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeTab(),
    );
  }
}