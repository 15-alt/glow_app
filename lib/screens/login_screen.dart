import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:glowapp/constants/glow_colors.dart';
import 'package:glowapp/screens/signUp_screen.dart';

import '../viewmodel/auth/auth_bloc.dart';
import '../viewmodel/auth/auth_event.dart';
import '../viewmodel/auth/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Connexion en cours...")),
          );
        }

        if (state is AuthSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Connexion réussie")));

          Navigator.pushReplacementNamed(context, "/doctor");
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },

      child: Scaffold(
        appBar: AppBar(title: const Text("Log In")),

        body: Padding(
          padding: const EdgeInsets.all(15),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerRight,

                child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Veuillez entrer votre email"),
                        ),
                      );

                      return;
                    }

                    if (passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Veuillez entrer votre mot de passe"),
                        ),
                      );

                      return;
                    }

                    context.read<AuthBloc>().add(
                      LoginEvent(
                        email: emailController.text.trim(),

                        password: passwordController.text.trim(),
                      ),
                    );
                  },
                  child: const Text("Login"),
                ),
              ),

              TextButton(
                onPressed: () {},
                child: const Text("Forgot password?"),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.g_mobiledata, size: 40, color: Colors.green),

                  SizedBox(width: 18),

                  Icon(Icons.facebook, size: 38, color: Colors.blue),

                  SizedBox(width: 18),

                  Icon(Icons.apple, size: 38, color: Colors.black),
                ],
              ),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignupScreen()),
                    );
                  },

                  child: const Text("Create account"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
