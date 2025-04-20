import 'package:cabinetmaker_app/screen/forgot_screen.dart';
import 'package:cabinetmaker_app/screen/home_screen.dart';
import 'package:cabinetmaker_app/screen/login_screen.dart';
import 'package:cabinetmaker_app/screen/profile_screen.dart';
import 'package:cabinetmaker_app/screen/register_screen.dart';
import 'package:cabinetmaker_app/screen/shop_home_screen.dart';
import 'package:cabinetmaker_app/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'common/internal_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cabinet Maker",
      initialRoute: InternalRouter.splash,
      routes: {
        InternalRouter.splash: (context) => const SplashScreen(),
        InternalRouter.home: (context) => const HomeScreen(),
        InternalRouter.login: (context) => const LoginScreen(),
        InternalRouter.register: (context) => const RegisterScreen(),
        InternalRouter.forgotPassword: (context) => const ForgotScreen(),
        InternalRouter.profile: (context) => const ProfileScreen(),
        InternalRouter.shopHome: (context) => const ShopHomeScreen(),
      },
    );
  }
}
