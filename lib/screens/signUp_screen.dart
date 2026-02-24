import 'package:flutter/material.dart';
import 'package:glowapp/screens/setpassword_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Account")),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Fullname",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: "Phone",
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: "Date of birth",
                  prefixIcon: Icon(Icons.calendar_today),
                ),
              ),
              SizedBox(height: 20),
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/setpassword'),
                  },
                  child: Text("Sign Up", selectionColor: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
