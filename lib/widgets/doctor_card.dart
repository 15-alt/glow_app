import 'package:flutter/material.dart';
import 'package:glowapp/models/doctor_model.dart';
import 'package:glowapp/screens/doctor_info_screen.dart';
import 'package:glowapp/constants/glow_colors.dart';

Widget doctorCard(BuildContext context, DoctorModel doctor) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(12),

    decoration: BoxDecoration(
      color: AppColors.primaryBlue,
      borderRadius: BorderRadius.circular(16),

      boxShadow: const [
        BoxShadow(color: AppColors.gold, blurRadius: 15, offset: Offset(0, 4)),
      ],
    ),

    child: Row(
      children: [
        /// IMAGE
        CircleAvatar(radius: 30, backgroundImage: AssetImage(doctor.image)),

        const SizedBox(width: 12),

        /// INFO
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// NAME
              Text(
                doctor.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.primaryBlue,
                ),
              ),

              const SizedBox(height: 4),

              /// DEGREE
              Text(
                doctor.degree,
                style: const TextStyle(color: AppColors.primaryBlue),
              ),

              const SizedBox(height: 4),

              /// SPECIALTY
              Text(
                doctor.specialty,
                style: const TextStyle(color: AppColors.primaryBlue),
              ),

              const SizedBox(height: 8),

              /// BUTTONS
              Row(
                children: [
                  /// INFO BUTTON
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.gold,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DoctorInfoScreen(doctor: doctor),
                        ),
                      );
                    },

                    child: const Text("Info"),
                  ),

                  const SizedBox(width: 8),

                  const Icon(
                    Icons.chat_bubble_outline,
                    size: 18,
                    color: AppColors.primaryBlue,
                  ),

                  const SizedBox(width: 8),

                  const Icon(
                    Icons.phone_outlined,
                    size: 18,
                    color: AppColors.primaryBlue,
                  ),

                  const SizedBox(width: 8),

                  const Icon(
                    Icons.favorite_border,
                    size: 18,
                    color: AppColors.primaryBlue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
