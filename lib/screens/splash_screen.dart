import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glowapp/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/glowapp.jpeg', width: 120, height: 120),
            SizedBox(height: 10),
            Text(
              "GlowApp",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white12,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "Une solution numérique de consultation en ligne dédiée à la médecine esthétique",
              style: TextStyle(fontSize: 16),
              selectionColor: Colors.white12,
            ),
          ],
        ),
      ),
    );
  }
}
