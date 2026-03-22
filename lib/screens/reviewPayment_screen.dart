import 'package:flutter/material.dart';
import 'package:glowapp/screens/payementMethod_screen.dart';
import 'package:glowapp/screens/paymentSuccess_screen.dart';

class ReviewPaymentScreen extends StatelessWidget {
  const ReviewPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "\$100.00",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),

            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage("assets/doctor_1.jpg"),
              ),
              title: const Text("Dr. Olivia Turner, M.D"),
              subtitle: const Text("Dermatologist"),
            ),

            const Divider(),

            const ListTile(title: Text("Date"), trailing: Text("March 24")),
            const ListTile(title: Text("Time"), trailing: Text("10:00 AM")),
            const ListTile(
              title: Text("Duration"),
              trailing: Text("30 Minutes"),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PaymentMethodScreen(),
                  ),
                );
              },
              child: const Text("Pay Now"),
            ),
          ],
        ),
      ),
    );
  }
}
