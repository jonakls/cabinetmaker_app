import 'package:cabinetmaker_app/common/color_palette.dart';
import 'package:cabinetmaker_app/common/text_app.dart';
import 'package:flutter/material.dart';

class SplashScreen  extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/images/logo.png'),
              width: 200,
              height: 200,
            ),
          ),
          SizedBox(height: 20),
          Text(
            TextApp.appName,
            style: TextStyle(
              fontSize: 24,
              color: ColorPalette.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          CircularProgressIndicator(
            color: ColorPalette.fourColor,
          ),
          SizedBox(height: 20),
          Text(
            TextApp.appTagline,
            style: TextStyle(
              fontSize: 16,
              color: ColorPalette.textColor,
            ),
          ),

        ],
      ),
    );
  }
}