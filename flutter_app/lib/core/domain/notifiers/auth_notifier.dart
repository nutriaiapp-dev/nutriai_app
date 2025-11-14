import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:nutri_app/core/controllers/auth_storage.dart';
import 'package:nutri_app/core/presentations/widgets/auth_dialog.dart';
import 'package:nutri_app/core/services/auth_services.dart';

class AuthNotifier extends StateNotifier<String?> {
  final Ref ref;
  final AuthService
  _authService; //Declaramos _authService como una variable de instancia

  AuthNotifier(this.ref) : _authService = AuthService(), super(null);

  Future<bool> login(String email, String password) async {
    try {
      // Intenta autenticar (asumo que _authService ya maneja errores internos)
      final token = await _authService.login(email, password);

      if (token != null) {
        // 1. Éxito: Actualiza el estado y guarda el token
        state = token;
        await AuthStorage().saveToken(token);
        return true; // <-- Devuelve ÉXITO
      } else {
        // 2. Falla de credenciales
        state = null;
        return false; // <-- Devuelve FRACASO
      }
    } catch (e) {
      // Manejo de errores de red o excepciones generales
      state = null;
      // Podrías devolver false o lanzar el error para que la UI lo maneje.
      return false;
    }
  }
}
