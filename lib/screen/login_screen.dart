import 'package:cabinetmaker_app/common/color_palette.dart';
import 'package:cabinetmaker_app/common/text_app.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: const AssetImage('assets/images/logo.png'),
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            TextApp.buttonLogin,
            style: TextStyle(
              fontSize: 24,
              color: ColorPalette.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            TextApp.appTextLogin,
            style: TextStyle(fontSize: 16, color: ColorPalette.textColor),
          ),
          const SizedBox(height: 30),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Usuario',
              prefixIcon: Icon(Icons.person, color: ColorPalette.textColor),
            ),
          ),
          const SizedBox(height: 30),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              prefixIcon: Icon(Icons.person, color: ColorPalette.textColor),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // TODO: Comprovación de credenciales
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
    );
  }
}
