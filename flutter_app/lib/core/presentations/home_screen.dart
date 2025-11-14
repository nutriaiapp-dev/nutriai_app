import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //Implementacion Home Screen
    return Scaffold(
      appBar: AppBar(title: const Text('Home - NutriAI')),
      body: const Center(child: Text('Home Screen')),
    );
  }
}
