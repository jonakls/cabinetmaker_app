import 'package:cabinetmaker_app/screen/forgot_screen.dart';
import 'package:cabinetmaker_app/screen/home_screen.dart';
import 'package:cabinetmaker_app/screen/login_screen.dart';
import 'package:cabinetmaker_app/screen/profile_screen.dart';
import 'package:cabinetmaker_app/screen/register_screen.dart';
import 'package:cabinetmaker_app/screen/shop_home_screen.dart';
import 'package:cabinetmaker_app/screen/splash_screen.dart';
import 'package:cabinetmaker_app/service/account_service.dart';
import 'package:cabinetmaker_app/service/google_auth_service.dart';
import 'package:flutter/material.dart';

import 'common/internal_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  /// Constructor for the MainApp widget.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cabinet Maker",
      initialRoute: InternalRouter.splash,
      routes: {
        InternalRouter.splash: (context) => const SplashScreen(),
        InternalRouter.home: (context) => const HomeScreen(),
        InternalRouter.login:
            (context) => LoginScreen(),
        InternalRouter.register: (context) => RegisterScreen(),
        InternalRouter.forgotPassword: (context) => const ForgotScreen(),
        InternalRouter.shopHome: (context) => const ShopMenuNavigation(),
      },
    );
  }
}
