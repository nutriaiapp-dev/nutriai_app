import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutri_app/core/presentations/home_page.dart';
import 'package:nutri_app/core/presentations/widgets/auth_dialog.dart';
import 'package:nutri_app/core/providers/register_provider.dart';

Future<void> register(
  BuildContext context,
  WidgetRef ref,
  TextEditingController userController,
  TextEditingController emailController,
  TextEditingController passwordController,
) async {
  await ref
      .read(registerProvider.notifier)
      .register(
        context,
        userController.text,
        emailController.text,
        passwordController.text,
      );

  final token = ref.read(registerProvider);
  if (token != null && context.mounted) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SecondScreen()),
    );
  } else if (context.mounted) {
    showErrorDialogPass(context);
  }
}
