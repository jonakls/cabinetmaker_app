import 'package:cabinetmaker_app/common/color_palette.dart';
import 'package:cabinetmaker_app/common/internal_router.dart';
import 'package:cabinetmaker_app/common/text_app.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage('assets/images/logo.png'),
                width: 200,
                height: 200,
              ),
              Text(
                TextApp.appName,
                style: TextStyle(
                  fontSize: 24,
                  color: ColorPalette.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  TextApp.appDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: ColorPalette.textColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, InternalRouter.login);
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
                  Navigator.pushNamed(context, InternalRouter.register);
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
      ),
    );
  }
}
