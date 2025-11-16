import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutri_app/core/controllers/auth_storage.dart';
import 'package:nutri_app/core/presentations/auth/login_page.dart';
import 'package:nutri_app/core/providers/auth_provider.dart';
import 'package:nutri_app/core/presentations/widgets/main_drawer.dart';

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
      drawer: const MyDrawer(),
      endDrawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                16.0,
              ), // Ajusta el valor para el radio
              child: Image.asset(
                'assets/images/welcome_app.png',
                width: 250,
                height: 250,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Bienvenido a NutriAI App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,

                color: Colors.grey[700],
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Tu plan de nutrición inteligente comienza aquí.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
