import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutri_app/core/domain/notifiers/register_notifier.dart';
import 'package:nutri_app/core/presentations/auth/register_screen.dart';
import 'package:nutri_app/core/presentations/widgets/pass_error.dart';
import 'package:nutri_app/core/utils/auth_utils.dart';
import 'package:nutri_app/core/utils/register_utils.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 80),
              Image.asset(
                'assets/images/nutriapp_logo.png',
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 50),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(55, 125, 68, 1.0),
                    ),
                  ),
                  labelText: 'Email',
                  hintText: 'Ingrese Email Registrado',
                ),
              ),

              const SizedBox(height: 20),
              TextField(
                obscureText: passwordVisible,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(55, 125, 68, 1.0),
                    ),
                  ),
                  labelText: 'Password',
                  hintText: 'Ingrese su password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  alignLabelWithHint: false,
                  filled: true,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity, // Boton ocupa todo el ancho disponible
                height: 50,
                child: ElevatedButton(
                  onPressed: () => login(
                    context,
                    ref,
                    _emailController,
                    _passwordController,
                  ),
                  style: ElevatedButton.styleFrom(
                    // Estilo actualizado para coincidir con tu snippet
                    backgroundColor: const Color.fromRGBO(55, 125, 68, 1.0),
                    foregroundColor: const Color.fromRGBO(230, 168, 34, 1),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 15, // Elevación aumentada
                  ),
                  child: const Text('Ingresar'),
                ), //ElevatedButton
              ), //SizedBox
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity, // Boton ocupa todo el ancho disponible
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
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
                  child: const Text('Registrarme'),
                ), //ElevatedButton
              ), //SizedBox
            ], //Widget[]
          ),
        ),
      ),
    );
  }
}
