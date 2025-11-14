import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutri_app/core/presentations/widgets/pass_error.dart';
import 'package:nutri_app/core/utils/register_utils.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _dateBirthController = TextEditingController();
  final TextEditingController _comunaController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  // Nueva variable de estado para el nivel de actividad
  String? _activityLevel;
  // Opciones para el Dropdown
  final List<String> _activityOptions = [
    'sedentary',
    'light',
    'moderate',
    'active',
  ];

  // Nueva variable de estado para el sexo del usuario

  String? _sexoUsuario;
  final List<String> _sexoOptions = ['Femenino', 'Masculino', 'Otro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(55, 125, 68, 1.0),
        foregroundColor: Color.fromRGBO(227, 230, 34, 1),
        title: const Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            TextField(
              keyboardType: TextInputType.text,
              controller: _userController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Usuario',
                hintText: 'Ingrese su nombre completo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                icon: Icon(Icons.email_outlined),
                labelText: 'Email',
                hintText: 'Ingrese su correo electronico',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                icon: Icon(Icons.password_outlined),
                labelText: 'Password',
                hintText: 'Ingrese su password alfanumerico',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                icon: Icon(Icons.password_sharp),
                labelText: 'Confirmar Password',
                hintText: 'Verificacion de password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _dateBirthController,
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today_rounded),
                labelText: 'Fecha de Nacimiento',
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                DateTime? pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                );
                if (pickeddate != null) {
                  setState(() {
                    _dateBirthController.text = DateFormat(
                      'yyyy-MM-dd',
                    ).format(pickeddate);
                  });
                }
              },
            ),

            const SizedBox(height: 12),
            TextField(
              controller: _comunaController,
              decoration: const InputDecoration(
                icon: Icon(Icons.house_outlined),
                labelText: 'Comuna',
                hintText: 'Ingrese su Comuna de Residencia',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12), // Separación antes del Dropdown
            // DropdownButtonFormField para el nivel de actividad
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                icon: Icon(Icons.sports_gymnastics),
                labelText: 'Nivel de Actividad',
                hintText: 'Seleccione su nivel de actividad física',
                border: OutlineInputBorder(),
              ),
              initialValue: _activityLevel,
              onChanged: (String? newValue) {
                setState(() {
                  _activityLevel = newValue;
                });
              },
              items: _activityOptions.map<DropdownMenuItem<String>>((
                String value,
              ) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            const SizedBox(height: 12), // Separación antes del Dropdown
            // DropdownButtonFormField para el nivel de actividad
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                icon: Icon(Icons.female),
                labelText: 'Sexo',
                hintText: 'Seleccione su Genero',
                border: OutlineInputBorder(),
              ),
              initialValue: _sexoUsuario,
              onChanged: (String? newValue) {
                setState(() {
                  _sexoUsuario = newValue;
                });
              },
              items: _sexoOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: _alturaController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Altura',
                hintText: 'Ingrese su altura en Cms',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: _pesoController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Peso',
                hintText: 'Ingrese su peso en Kgs',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                if (_passwordController.text ==
                    _confirmPasswordController.text) {
                  // Generamos la fecha de registro en formato ISO 8601 (String)
                  final String fechaRegistro = DateTime.now().toIso8601String();

                  await register(
                    context,
                    ref,
                    _userController,
                    _emailController,
                    _passwordController,
                    _dateBirthController,
                    _comunaController,
                    _activityLevel ?? _activityOptions.first,
                    _sexoUsuario ?? '',
                    _alturaController,
                    _pesoController,
                    fechaRegistro,
                  );
                } else {
                  showErrorDialogPass(context);
                }
              },
              style: ElevatedButton.styleFrom(
                // Estilo actualizado para coincidir con tu snippet
                backgroundColor: const Color.fromRGBO(230, 168, 34, 1),
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 15, // Elevación aumentada
              ),
              child: const Text(
                'Confirmar', // Texto actualizado
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
