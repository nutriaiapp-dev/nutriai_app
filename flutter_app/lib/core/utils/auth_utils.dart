import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutri_app/core/presentations/home_page.dart';
import 'package:nutri_app/core/presentations/widgets/auth_dialog.dart';
import 'package:nutri_app/core/providers/auth_provider.dart';

Future<void> login(
  BuildContext context,
  WidgetRef ref,
  TextEditingController emailController,
  TextEditingController passwordController,
) async {
  await ref
      .read(authProvider.notifier)
      .login(context, emailController.text, passwordController.text,);

  final isMonted = context.mounted;

  final token = ref.read(authProvider);

  if (token != null) {
    if (Navigator.of(context).mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SecondScreen()),
      );
    } else if {
        showErrorDialog(context);
    }
  }
}
