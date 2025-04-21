import 'package:cabinetmaker_app/common/color_palette.dart';
import 'package:cabinetmaker_app/common/internal_router.dart';
import 'package:cabinetmaker_app/common/text_app.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              TextApp.buttonRegister,
              style: TextStyle(
                fontSize: 24,
                color: ColorPalette.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              TextApp.appTextLogin,
              style: TextStyle(fontSize: 16, color: ColorPalette.textColor),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Correo electronico',
                prefixIcon: Icon(Icons.email, color: ColorPalette.textColor),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nombre de usuario',
                prefixIcon: Icon(
                  Icons.verified_user,
                  color: ColorPalette.textColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nombre completo',
                prefixIcon: Icon(Icons.person, color: ColorPalette.textColor),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.security, color: ColorPalette.textColor),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirmar contraseña',
                prefixIcon: Icon(Icons.security, color: ColorPalette.textColor),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // TODO: Registro y creación de usuario
                Navigator.pushNamed(context, InternalRouter.shopHome);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPalette.accentColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 15,
                ),
              ),
              child: const Text(
                TextApp.buttonRegister,
                style: TextStyle(fontSize: 16, color: ColorPalette.textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
