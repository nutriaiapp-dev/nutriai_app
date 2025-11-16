import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutri_app/core/presentations/second_screen.dart';
import 'package:nutri_app/core/presentations/widgets/auth_dialog.dart';
import 'package:nutri_app/core/providers/auth_provider.dart';

Future<void> login(
  BuildContext context,
  WidgetRef ref,
  TextEditingController emailController,
  TextEditingController passwordController,
) async {
  // 1. Ejecutar la lógica y esperar el resultado (true/false)
  final success = await ref
      .read(authProvider.notifier)
      .login(emailController.text, passwordController.text);
  // 2. Verificar montaje antes de usar el contexto
  if (!context.mounted) return;

  if (success) {
    // Éxito: Navegar
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SecondScreen()),
    );
  } else {
    // Fracaso: Mostrar diálogo de error (se hace en la UI)
    showErrorDialog(context);
  }
}
