import 'package:flutter/material.dart';

class SetpasswordScreen extends StatelessWidget {
  const SetpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Set Password")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Create New Password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: " New Password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 15),

            TextField(
              decoration: InputDecoration(
                labelText: " Confirm Password",
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/doctor'),
                child: Text("Finish", selectionColor: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
