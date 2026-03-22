import 'package:flutter/material.dart';

import 'package:glowapp/screens/signUp_screen.dart';
import 'package:glowapp/constants/glow_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log In")),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "welcome",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBlue,
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.lightBlue,
                labelText: "Email or Phone",
                prefixIcon: Icon(Icons.email),
                iconColor: AppColors.gold,
              ),
            ),

            SizedBox(height: 12),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "PassWord",
                prefixIcon: Icon(Icons.lock),
                iconColor: Colors.blueAccent,
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),

            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,

              child: ElevatedButton(onPressed: () {}, child: Text("Login")),
            ),

            TextButton(onPressed: () {}, child: Text("Forgot password?")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.g_mobiledata, size: 40, color: Colors.green),
                SizedBox(width: 18),
                Icon(Icons.facebook, size: 38, color: Colors.blue),
                SizedBox(width: 18),
                Icon(Icons.apple, size: 38, color: Colors.black),
                SizedBox(width: 18),
              ],
            ),
            SizedBox(width: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SignupScreen()),
                  );
                },
                child: Text("Create account", selectionColor: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
