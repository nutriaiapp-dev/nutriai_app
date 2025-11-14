import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutri_app/core/controllers/auth_storage.dart';
import 'package:nutri_app/core/presentations/auth/login_page.dart';
import 'package:nutri_app/core/providers/auth_provider.dart';

class SecondScreen extends ConsumerStatefulWidget {
  const SecondScreen({super.key});

  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends ConsumerState<SecondScreen> {
  Future<void> _logout() async {
    //Borramos el token de almacenamiento y estado
    await AuthStorage().deleteToken();
    ref.read(authProvider.notifier).state = null;

    // Navegamos de regreso a la pantalla Login

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(55, 125, 68, 1.0),
        foregroundColor: Color.fromRGBO(227, 230, 34, 1),
        title: const Text('Menu Principal'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ), // IconButton
        ],
      ),
      body: const Center(child: Text('Bienvenido a NutriAI App')),
    );
  }
}
