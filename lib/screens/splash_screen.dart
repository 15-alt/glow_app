import 'package:flutter/material.dart';

import 'package:glowapp/constants/glow_colors.dart';
import 'package:glowapp/services/secure_storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SecureStorageService storage = SecureStorageService();

  @override
  void initState() {
    super.initState();

    checkLogin();
  }

  Future<void> checkLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    final token = await storage.getToken();

    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, "/doctor");
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Image.asset("assets/glowapp.jpeg", width: 120, height: 120),

            const SizedBox(height: 15),

            const Text(
              "GlowApp",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.gold,
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Une solution numérique de consultation en ligne dédiée à la médecine esthétique",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 40),

            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
