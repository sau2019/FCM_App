import 'dart:async';
import 'package:fcmapp/screens/landingpage/landingpage.dart';
import 'package:fcmapp/utils/globalwidget.dart';
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

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LandingPage()));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: css.color1,
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          width: 100,
        ),
      ),
    );
  }
}
