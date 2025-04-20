import 'package:cabinetmaker_app/common/color_palette.dart';
import 'package:cabinetmaker_app/common/text_app.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              TextApp.appName,
              style: TextStyle(
                fontSize: 24,
                color: ColorPalette.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              TextApp.appDescription,
              style: TextStyle(
                fontSize: 24,
                color: ColorPalette.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPalette.accentColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 15,
                ),
              ),
              child: const Text(
                TextApp.buttonLogin,
                style: TextStyle(fontSize: 16, color: ColorPalette.textColor),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
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
