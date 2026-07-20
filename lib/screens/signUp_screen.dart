import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/glow_colors.dart';
import '../viewmodel/auth/auth_bloc.dart';
import '../viewmodel/auth/auth_event.dart';
import '../viewmodel/auth/auth_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String role = "client";

  @override
  void dispose() {
    nomController.dispose();
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
            const SnackBar(content: Text("Création du compte...")),
          );
        }

        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Compte créé avec succès")),
          );

          Navigator.pushReplacementNamed(context, "/doctor");
        }

        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },

      child: Scaffold(
        appBar: AppBar(title: const Text("Sign Up")),

        body: Padding(
          padding: const EdgeInsets.all(20),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  "Create Account",

                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlue,
                  ),
                ),

                const SizedBox(height: 25),

                TextField(
                  controller: nomController,

                  decoration: const InputDecoration(
                    labelText: "Nom",

                    prefixIcon: Icon(Icons.person),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: emailController,

                  decoration: const InputDecoration(
                    labelText: "Email",

                    prefixIcon: Icon(Icons.email),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: passwordController,

                  obscureText: true,

                  decoration: const InputDecoration(
                    labelText: "Password",

                    prefixIcon: Icon(Icons.lock),
                  ),
                ),

                const SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  value: role,

                  decoration: const InputDecoration(labelText: "Role"),

                  items: const [
                    DropdownMenuItem(value: "client", child: Text("Client")),

                    DropdownMenuItem(
                      value: "estheticienne",

                      child: Text("Esthéticienne"),
                    ),
                  ],

                  onChanged: (value) {
                    setState(() {
                      role = value!;
                    });
                  },
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: () {
                      if (nomController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Tous les champs sont obligatoires"),
                          ),
                        );

                        return;
                      }

                      context.read<AuthBloc>().add(
                        RegisterEvent(
                          nom: nomController.text.trim(),

                          email: emailController.text.trim(),

                          password: passwordController.text.trim(),

                          role: role,
                        ),
                      );
                    },

                    child: const Text("Créer un compte"),
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text("J'ai déjà un compte"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
