import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutri_app/core/presentations/home_screen.dart';
import 'package:nutri_app/core/presentations/second_screen.dart';
import 'package:nutri_app/core/presentations/widgets/auth_dialog.dart';
import 'package:nutri_app/core/providers/register_provider.dart';
import 'package:nutri_app/core/presentations/widgets/pass_error.dart';

Future<void> register(
  BuildContext context,
  WidgetRef ref,
  TextEditingController userController,
  TextEditingController emailController,
  TextEditingController passwordController,
  TextEditingController dateBirthController,
  TextEditingController comunaController,
  String? activityLevel,
  String? sexoUsuario,
  TextEditingController alturaController,
  TextEditingController pesoController,
  String fechaRegistro,
) async {
  await ref
      .read(registerProvider.notifier)
      .register(
        context,
        userController.text,
        emailController.text,
        passwordController.text,
        dateBirthController.text,
        comunaController.text,
        activityLevel ?? '', // Proporciona '' si es nulo
        sexoUsuario ?? '', // Proporciona '' si es nulo
        alturaController.text,
        pesoController.text,
        fechaRegistro,
      );

  final token = ref.read(registerProvider);
  if (token != null && context.mounted) {
    // Asumiendo que SecondScreen está definida en otra parte
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SecondScreen()),
    );
  } else if (context.mounted) {
    showErrorDialogPass(context);
  }
}
