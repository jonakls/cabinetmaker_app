import 'package:cabinetmaker_app/common/color_palette.dart';
import 'package:cabinetmaker_app/common/internal_router.dart';
import 'package:cabinetmaker_app/common/text_app.dart';
import 'package:cabinetmaker_app/service/account_service.dart';
import 'package:cabinetmaker_app/service/google_auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final GoogleAuthService _googleAuthService;
  final AccountService _accountService;

  const LoginScreen(this._googleAuthService, this._accountService, {super.key});

  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
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
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Usuario',
                prefixIcon: Icon(Icons.person, color: ColorPalette.textColor),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.person, color: ColorPalette.textColor),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _accountService
                    .signIn(_emailController.text, _passwordController.text)
                    .then((value) {
                      if (value != null) {
                        Navigator.pushNamed(context, InternalRouter.shopHome);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('No se logro obtener el usuario'),
                          ),
                        );
                      }
                    })
                    .onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Ocurrio un error al iniciar sesion'),
                        ),
                      );
                    });

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
                TextApp.buttonLogin,
                style: TextStyle(fontSize: 16, color: ColorPalette.textColor),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                _googleAuthService
                    .signInWithGoogle()
                    .then((value) {
                      if (value != null) {
                        Navigator.pushNamed(context, InternalRouter.shopHome);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('No se logro obtener el usuario'),
                          ),
                        );
                      }
                    })
                    .onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Ocurrio un error al iniciar sesion'),
                        ),
                      );
                    });
              },
              icon: Image.asset(
                'assets/images/google_icon.png',
                width: 25,
                height: 25,
              ),
              label: const Text(TextApp.buttonGoogleLogin),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPalette.accentColor,
                foregroundColor: ColorPalette.textColor,
                side: BorderSide(color: Colors.grey.shade300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 55,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
