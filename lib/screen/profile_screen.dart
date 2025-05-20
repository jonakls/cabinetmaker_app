import 'package:cabinetmaker_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../service/account_service.dart';
import '../service/google_auth_service.dart';

class ProfileScreen extends StatelessWidget {
  static final AccountService _accountService = AccountService().get();
  static final GoogleAuthService _googleAuthService = GoogleAuthService().get();

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? userName = getUserName() ?? '';
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Image(
                  image: const AssetImage('assets/images/logo.png'),
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Perfil de usuario',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Nombre: $userName',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'John Doe',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? getUserName() {
    _googleAuthService
        .isSignedIn()
        .then((isSigned) {
          if (isSigned) {
            GoogleSignInAccount? googleUser = _googleAuthService.currentUser;
            if (googleUser != null) {
              return googleUser.displayName;
            } else {
              return '';
            }
          } else {
            UserModel? user = _accountService.currentUser;
            if (user != null) {
              return user.name;
            } else {
              return '';
            }
          }
        })
        .catchError((error) {
          print('Error: $error');
          return '';
        });
    return null;
  }
}
