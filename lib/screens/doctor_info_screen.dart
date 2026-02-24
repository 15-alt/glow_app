import 'package:flutter/material.dart';
import 'package:glowapp/models/doctor_model.dart';
import 'package:glowapp/screens/notifications_screen.dart';
import 'package:glowapp/screens/mini_info.dart';

class DoctorInfoScreen extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorInfoScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(doctor.name), centerTitle: true),

      /// BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            /// IMAGE DU DOCTEUR
            CircleAvatar(radius: 50, backgroundImage: AssetImage(doctor.image)),

            const SizedBox(height: 12),

            /// NOM
            Text(
              doctor.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            /// SPECIALITE
            Text(
              doctor.specialty,
              style: const TextStyle(fontSize: 16, color: Colors.green),
            ),

            const SizedBox(height: 20),

            /// MINI INFOS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MiniInfo(
                  "Profile",
                  "Profil professionnel de ${doctor.name} spécialisé en ${doctor.specialty}.",
                ),

                MiniInfo(
                  "Career path",
                  "${doctor.name} possède un diplôme ${doctor.degree} avec une grande expérience.",
                ),

                MiniInfo(
                  "Highlights",
                  "Expert certifié offrant des soins modernes et personnalisés.",
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Text(
              "Experienced doctor focused on patient care.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationsScreen(doctor: doctor),
                  ),
                );
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),

      /// BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,

        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Calendar",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Chats",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
