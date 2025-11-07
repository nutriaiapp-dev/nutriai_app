import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutri_app/core/controllers/auth_storage.dart';
import 'package:nutri_app/core/presentations/auth/login_page.dart';
import 'package:nutri_app/core/presentations/home_page.dart';
import 'package:nutri_app/core/providers/auth_provider.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  late Future<void> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = _checkAuth();
  }

  Future<void> _checkAuth() async {
    final token = await AuthStorage().getToken();
    if (token != null) {
      ref.read(authProvider.notifier).state = token;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ); //Scaffold
          } else {
            final token = ref.watch(authProvider);
            return token == null ? const LoginScreen() : const SecondScreen();
          }
        },
      ),
    );
  }
}
