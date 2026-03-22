import 'package:flutter/material.dart';
import 'package:glowapp/constants/glow_colors.dart';
import 'package:glowapp/screens/paymentSuccess_screen.dart';
import 'add_card_screen.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment Method")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Credit & Debit Card",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text("Add New Card"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddCardScreen()),
                );
              },
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "More Payment Option",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const ListTile(
              leading: Icon(Icons.apple),
              iconColor: AppColors.primaryBlue,
              title: Text("Apple Pay"),
            ),
            const ListTile(
              leading: Icon(Icons.paypal),
              iconColor: AppColors.primaryBlue,
              title: Text("Paypal"),
            ),
            const ListTile(
              leading: Icon(Icons.g_mobiledata),
              iconColor: AppColors.primaryBlue,
              title: Text("Google Pay"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentSuccessScreen(),
                  ),
                );
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
