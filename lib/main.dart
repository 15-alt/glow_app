import 'package:flutter/material.dart';
import 'package:glowapp/constants/glow_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowapp/models/doctor_model.dart';
import 'package:glowapp/core/dependency_injection.dart';
import 'package:glowapp/viewmodel/auth/auth_bloc.dart';
import 'package:glowapp/screens/splash_screen.dart';
import 'package:glowapp/screens/login_screen.dart';
import 'package:glowapp/screens/signUp_screen.dart';
import 'package:glowapp/screens/setpassword_screen.dart';
import 'core/dio_client.dart';
import 'package:glowapp/screens/doctor_screen.dart';
import 'package:glowapp/screens/doctor_info_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioClient.initialize();

  setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => getIt<AuthBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: "Glow App",

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

        initialRoute: "/",

        routes: {
          "/": (context) => const SplashScreen(),

          "/login": (context) => const LoginScreen(),

          "/signup": (context) => const SignupScreen(),

          "/setpassword": (context) => const SetpasswordScreen(),

          "/doctor": (context) => const DoctorScreen(),
        },

        onGenerateRoute: (settings) {
          if (settings.name == "/doctorInfo") {
            final doctor = settings.arguments as DoctorModel;

            return MaterialPageRoute(
              builder: (_) => DoctorInfoScreen(doctor: doctor),
            );
          }

          return null;
        },
      ),
    );
  }
}
