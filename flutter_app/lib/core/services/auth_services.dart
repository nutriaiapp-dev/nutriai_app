import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:4000/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['token'];
    } else {
      return null;
    }
  }

  Future<String?> register(
    String nombre,
    String email,
    String password,
    String dateBirth,
    String comuna,
    String activityLevel,
    String sexoUsuario,
    String altura,
    String peso,
    String fechaRegistro,
  ) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:4000/api/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nombre': nombre,
        'email': email,
        'password': password,
        'fecha_nacimiento': dateBirth,
        'nivel_actividad': activityLevel,
        'comuna': comuna,
        'sexo': sexoUsuario,
        'altura': altura,
        'peso': peso,
        'fecha_registro': fechaRegistro,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.body.startsWith('{')) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data['token'];
      } else {
        return 'Usuario registrado';
      }
    } else {
      //print('Status code: ${response.statusCode}');
      return null;
    }
  }
}
