import 'package:flutter/material.dart';
import 'package:glowapp/models/doctor_model.dart';
import 'package:glowapp/screens/chatdetails_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Liste des docteurs
    final List<DoctorModel> doctors = [
      DoctorModel(
        name: "Dr Alexander Bell",
        specialty: "Cosméticien",
        image: 'assets/doctor_1.jpg',
        degree: "Ph.D",
      ),
      DoctorModel(
        name: "Dr Stephane Bell",
        specialty: "Chirurgien plasticien",
        image: 'assets/doctor_2.jpg',
        degree: "M.D",
      ),
      DoctorModel(
        name: "Dr Annabelle Bell",
        specialty: "Dermatologue",
        image: 'assets/doctor_3.jpg',
        degree: "D.O",
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Chats"), centerTitle: true),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: doctors.length,

        itemBuilder: (context, index) {
          final doctor = doctors[index];

          return ChatItem(
            doctor: doctor,
            message: "Tap to open chat",

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatDetailScreen(doctor: doctor),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final DoctorModel doctor;
  final String message;
  final VoidCallback onTap;

  const ChatItem({
    super.key,
    required this.doctor,
    required this.message,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),

      child: ListTile(
        onTap: onTap,

        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(doctor.image),
        ),

        title: Text(
          doctor.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        subtitle: Text(message),

        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
