import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:nutri_app/core/controllers/auth_storage.dart';
import 'package:nutri_app/core/presentations/widgets/auth_dialog.dart';
import 'package:nutri_app/core/services/auth_services.dart';

class AuthNotifier extends StateNotifier<String?> {
  final Ref ref;
  final AuthService
  _authService; //Declaramos _authService como una variable de instancia

  AuthNotifier(this.ref) : _authService = AuthService(), super(null);

  Future<void> login(
    BuildContext context,
    String nombre,
    String email,
    String password,
  ) async {
    final token = await _authService.login(email, password);
    if (token != null) {
      state = token;
      await AuthStorage().saveToken(token);
    } else {
      if (context.mounted) {
        showErrorDialog(context);
      }
    }
  }
}
