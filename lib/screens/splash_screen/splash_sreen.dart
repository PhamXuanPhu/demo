import 'package:conasi/resource/assets.dart';
import 'package:conasi/screens/home_screen.dart';
import 'package:conasi/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          Navigator.of(context).pushReplacement(
              CupertinoPageRoute(builder: (context) => const LoginScreen()))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(Images.logoSplashScreen)],
      ),
    );
  }
}
