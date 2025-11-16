import 'package:flutter/material.dart';
import 'package:nutri_app/core/presentations/second_screen.dart';
import 'package:nutri_app/core/presentations/widgets/text_icon_button.dart';
import 'package:nutri_app/core/presentations/widgets/profile_user_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Header part of the drawer
          InkWell(
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            ),
            child: buildHeader(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextIconButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const SecondScreen()),
                  ),
                  icon: Icons.home,
                  label: 'Inicio',
                ),
                const TextIconButton(
                  icon: Icons.playlist_add_check,
                  label: 'Generar Receta IA',
                ),
                const TextIconButton(
                  icon: Icons.health_and_safety_sharp,
                  label: 'Perfil de salud',
                ),
                const TextIconButton(
                  icon: Icons.restaurant_sharp,
                  label: 'Mis Recetas',
                ),
                const TextIconButton(
                  icon: Icons.settings,
                  label: 'Datos Personales',
                ),
                const Divider(height: 50, color: Colors.black, thickness: 1),
                TextIconButton(
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  icon: Icons.logout,
                  label: 'Cerrar sesion',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildHeader() => InkWell(
  child: Container(
    padding: const EdgeInsets.only(top: 40, bottom: 20),
    color: const Color.fromRGBO(55, 125, 68, 1.0),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/images/women_avatar.png'),
        ),
        SizedBox(height: 15),
        Text(
          'Angery Serrada',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: Colors.white),
            Text('Santiago, Chile', style: TextStyle(color: Colors.white70)),
          ],
        ),
      ],
    ),
  ),
);
