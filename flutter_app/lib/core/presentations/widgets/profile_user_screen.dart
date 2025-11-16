import 'package:flutter/material.dart';
import 'package:nutri_app/core/presentations/widgets/main_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/women_avatar.png'),
          const SizedBox(height: 15),
          const Text(
            'Angery Serrada',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 15),
          const Text(
            'Estudiante de Ingenieria Informatica y Deportista',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
