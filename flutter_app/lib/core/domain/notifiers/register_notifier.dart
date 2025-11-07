import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:nutri_app/core/controllers/auth_storage.dart';
import 'package:nutri_app/core/presentations/widgets/pass_error.dart';
import 'package:nutri_app/core/services/auth_services.dart';

class RegisterNotifier extends StateNotifier<String?> {
  final Ref ref;
  final AuthService _authService;

  RegisterNotifier(this.ref) : _authService = AuthService(), super(null);

  Future<void> register(
    BuildContext context,
    String nombre,
    String email,
    String password,
  ) async {
    final token = await _authService.register(nombre, email, password);
    if (token != null) {
      state = token;
      await AuthStorage().saveToken(token);
    } else {
      if (context.mounted) {
        showErrorDialogPass(context);
      }
    }
  }
}
