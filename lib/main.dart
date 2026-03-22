import 'package:flutter/material.dart';
import 'package:glowapp/constants/glow_colors.dart';

import 'package:glowapp/models/doctor_model.dart';

import 'package:glowapp/screens/splash_screen.dart';
import 'package:glowapp/screens/login_screen.dart';
import 'package:glowapp/screens/signUp_screen.dart';
import 'package:glowapp/screens/setpassword_screen.dart';
import 'package:glowapp/screens/doctor_screen.dart';
import 'package:glowapp/screens/doctor_info_screen.dart';
import 'package:glowapp/constants/glow_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Glow App',

      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.lightBlue),

        scaffoldBackgroundColor: Colors.white,

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.gold),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.lightBlue,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),

      /// écran de démarrage
      initialRoute: '/',

      /// toutes les routes de l'application
      routes: {
        '/': (context) => const SplashScreen(),

        '/login': (context) => const LoginScreen(),

        '/signup': (context) => const SignupScreen(),

        '/setpassword': (context) => const SetpasswordScreen(),

        '/doctor': (context) => const DoctorScreen(),
      },

      /// routes avec arguments
      onGenerateRoute: (settings) {
        if (settings.name == '/doctorInfo') {
          final doctor = settings.arguments as DoctorModel;

          return MaterialPageRoute(
            builder: (context) => DoctorInfoScreen(doctor: doctor),
          );
        }

        return null;
      },
    );
  }
}
